//
//  main.cpp
//  Sort1
//
//  Created by Prasanna Prakash on 4/25/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//

#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include <algorithm>
#include <cstdlib>

using namespace std;

void stl_merge(vector<int> &a,int s,int m,int r)
{
    int n = r - s + 1;
    
    vector<int> b(n);
    
    int i1 = s;
    int i2 = m + 1;
    int j = 0;
    
    while (i1 <= m && i2 <= r)
    {
        if (a[i1] < a[i2])
        {
            b[j] = a[i1];
            i1++;
        }
        else
        {
            b[j] = a[i2];
            i2++;
        }
        j++;
    }
    
    while (i1 <= m)
    {
        b[j] = a[i1];
        i1++;
        j++;
    }
    
    while (i2 <= r)
    {
        b[j] = a[i2];
        i2++;
        j++;
    }
    
    for (j = 0; j < n; j++)
        a[s + j] = b[j];
    
}

void mergesort(vector<int> &a,int start,int stop)
{
    for (int i=1;i<=stop-start;i=i+i)
        for (int j=start;j<=stop-i;j+=i+i)
            stl_merge(a,j,j+i-1,min(j+i+i-1,stop));
}

int main()
{
    vector<int> a;
    string line="";
    ifstream fin("input.txt");
    
    while (getline(fin, line))
        a.push_back(atoi(line.c_str()));
    
    mergesort(a,0,a.size()-1);
    
    ofstream fout("output.txt");
    
    for (int i=0; i<a.size(); i++)
        fout << a[i] << " ";
    cout << endl;
    return 0;
}
