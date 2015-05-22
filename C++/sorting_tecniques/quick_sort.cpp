//
//  main.cpp
//  quick_sort
//
//  Created by Prasanna Prakash on 4/20/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//

#include <iostream>
#include <vector>
#include <string>
#include <ctime>
#include <fstream>
#include <algorithm>

using namespace std;

int partition(vector<int> & v, int fromIndex, int toIndex)
{
    int pivot = v[fromIndex];
    int leftIndex = fromIndex + 1;
    int rightIndex = toIndex;
    
    do
    {
        // move in from left to find next larger element
        while(v[leftIndex] <= pivot && leftIndex < rightIndex)
            leftIndex++;
        
        // move in from right to find next smaller element
        while(v[rightIndex] > pivot)
            rightIndex--;
        
        // swap large element with small element
        if (leftIndex < rightIndex)
            swap(v[leftIndex], v[rightIndex]);
        
    } while(leftIndex < rightIndex);
    
    // move pivot element to middle of list
    swap(v[rightIndex], v[fromIndex]);
    
    return rightIndex;
}


void quicksort(vector<int> & v, int fromIndex, int toIndex)
{
    if (fromIndex < toIndex)
    {
        // pivot(v, fromIndex, toIndex); // optional
        int middle = partition(v, fromIndex, toIndex);
        quicksort(v, fromIndex, middle - 1);
        quicksort(v, middle + 1, toIndex);
    }
}


int main(int argc, const char * argv[])
{
    string filename="", line="";
    
    cout << "Enter the name of the input file: ";
    cin >> filename;
    cout << endl;
    
    ifstream fin(filename.c_str());
    ofstream fout("output_quick_sort.txt");
    
    vector<int> a;
    
    while (getline(fin,line))
    {
        a.push_back(atoi(line.c_str()));
    }
    
    //Start timing sorting procedure
    clock_t start=clock();
    quicksort(a, 0, a.size()-1);
    //Stop timing sorting procedure
    clock_t stop=clock();

    for(int i=0; i<a.size(); i++)
        fout << a[i] << endl;
    
    cout << "Quick Sort took ";
    cout << (double)1000*(stop-start) /CLOCKS_PER_SEC << " milliseconds." << endl;
    
    fin.close();
    fout.close();

    
    return 0;
    
}
