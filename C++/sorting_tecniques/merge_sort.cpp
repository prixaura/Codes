//
//  main.cpp
//  merge_sort
//
//  Created by Prasanna Prakash on 4/20/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//

#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <string>
#include <ctime>
#include <queue>

using namespace std;

typedef vector<int> IntVector;
typedef IntVector::iterator IntVectorIt;

void stl_merge(IntVector& a,int s,int m,int r);
void mergesort(IntVector& a);

void stl_merge(IntVector& a,int s,int m,int r)
{
    int n = r - s + 1; // size of the range to be merged
    
    // merge both halves into a temporary vector b
    IntVector b(n);
    
    int i1 = s;  // next element to consider in the first half
    int i2 = m + 1;    // next element to consider in the second half
    int j = 0;           // next open position in b
    
    // as long as neither i1 nor i2 is past the end,
    // move the smaller element into b
    
    while (i1 <= m and i2 <= r)
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
    
    // note that only one of the two while loops below is executed
    
    // copy any remaining entries of the first half
    while (i1 <= m)
    {
        b[j] = a[i1];
        i1++;
        j++;
    }
    // copy any remaining entries of the second half
    while (i2 <= r)
    {
        b[j] = a[i2];
        i2++;
        j++;
    }
    
    // copy back from the temporary vector
    for (j = 0; j < n; j++)
        a[s + j] = b[j];
    
}

void margesort(IntVector& a)
{
    for (int i = 1; i <= a.size() / 2 + 1; i *= 2)
    {
        for (int j = i; j < a.size(); j += 2 * i)
        {
            stl_merge(a, j - i, j, min(j + i, (int)a.size()));
        }
    }
    
}
int main()
{
    string filename="", line="";
    
    cout << "Enter the input file to be sorted: ";
    cin >> filename;
    cout << endl;
    
    ifstream fin (filename.c_str());
    ofstream fout ("output_merge_sort.txt");
    
    IntVector a;
    
    while (getline(fin,line))
    {
        a.push_back(atoi(line.c_str()));
    }
    
    clock_t start = clock();
    mergesort(a);
    clock_t stop = clock();
    
    for(int i=0; i<a.size(); i++)
        fout<< a[i] << endl;
    
    cout << "Merge Sort took ";
    cout << (double)1000*(stop-start) /CLOCKS_PER_SEC << " milliseconds." << endl;
    
    fin.close();
    fout.close();

    
    return 0;
}
