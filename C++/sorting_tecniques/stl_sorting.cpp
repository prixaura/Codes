//
//  main.cpp
//  stl_sorting
//
//  Created by Prasanna Prakash on 4/20/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//

#include <ctime>
#include <cstdlib>
#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <fstream>

using namespace std;

int main()
{
    typedef vector<int> IntVector;
    typedef IntVector::iterator IntVectorIt;
    
    string filename="", line="";
    
    cout << "Enter the name of the input file: ";
    cin >> filename;
    cout << endl;
    
    ifstream fin(filename.c_str());
    ofstream fout("output_stl_sort.txt");
    
    IntVector NumbersVector;
    
    while (getline(fin,line))
    {
        NumbersVector.push_back(atoi(line.c_str()));
    }
    
    IntVectorIt startv,endv,itv;
    startv = NumbersVector.begin();
    endv = NumbersVector.end();
    
    
    //Start timing sorting procedure
    clock_t start=clock();
    sort(startv,endv);
    //Stop timing sorting procedure
    clock_t stop=clock();
    
    
    for(itv=startv;itv!=endv;itv++)
        fout << *itv << endl;
    
    cout << "STL Sorting took ";
    cout << (double)1000*(stop-start) /CLOCKS_PER_SEC << " milliseconds." << endl;
    
    fin.close();
    fout.close();
    
    return 0;
}


