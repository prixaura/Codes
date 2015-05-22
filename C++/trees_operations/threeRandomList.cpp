//
//  main.cpp
//  Random
//
//  Created by Prasanna Prakash on 4/20/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//

#include <iostream>
#include <algorithm>
#include <vector>
#include <ctime>
#include <cstdlib>
#include <fstream>
#include <string>

using namespace std;

int myrandom (int i) { return rand()%i;}

int main ()
{
    srand ( unsigned ( time(0) ) );
    vector<int> myvector;
    
    int n=0;
    string filename="", filename1="", filename2="", filename3="";
    
    cout << "Enter the range: ";
    cin >> n;
    
    cout << "Enter the name of output file (excluding the .txt extension): ";
    cin >> filename;
    
    filename1=filename+"1"+".txt";
    filename2=filename+"2"+".txt";
    filename3=filename+"3"+".txt";
    
    ofstream fout1 (filename1.c_str());
    ofstream fout2 (filename2.c_str());
    ofstream fout3 (filename3.c_str());
    
    clock_t start=clock();
    
    for (int i=0; i<n; ++i) myvector.push_back(i);
    
    random_shuffle ( myvector.begin(), myvector.end(), myrandom);
    
    for (vector<int>::iterator it=myvector.begin(); it!=myvector.end(); ++it)
    {
        fout1 << *it << endl;
        fout2 << *it << endl;
        fout3 << *it << endl;
    }
    
    clock_t stop = clock();
    
    cout << "The contents of the vector has been printed in " << filename1 << ", " << filename2 << " and " << filename3 << "." << endl;

    fout1.close();
    fout2.close();
    fout3.close();
    
    cout << "File creation took: ";
    cout << ((double)1000*(stop-start) /CLOCKS_PER_SEC)/1000 << " seconds." << endl;
    
    return 0;
}
