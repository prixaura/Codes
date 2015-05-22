//
//  main.cpp
//  lookups
//
//  Created by Prasanna Prakash on 4/23/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//

#include <iostream>
#include <ctime>
#include <cstdlib>
#include <ctime>
#include <fstream>
#include <algorithm>
#include <vector>

using namespace std;

int myrandom (int i) { return rand()%i; }

struct TNode
{
    int data;
    TNode *left_link;
    TNode *right_link;
};

TNode *create(int m)
{
    TNode *newp = new TNode;
    newp->data = m;
    newp->left_link = NULL;
    newp->right_link = NULL;
    return newp;
}

TNode *insert(TNode *treep, TNode *newp)
{
    if (treep == NULL)
        return newp;
    if (newp->data == treep->data)
        cout << "Number " << newp->data << " is already included." << endl;
    else if (newp->data < treep->data)
        treep->left_link = insert(treep->left_link, newp);
    else
        treep->right_link = insert(treep->right_link, newp);
    return treep;
}

TNode *lookup(TNode *treep, int m)
{
    if (treep == NULL)
        return NULL;
    if (m == 0)
        return treep;
    else if (m < 0)
        return lookup(treep->left_link, m);
    else
        return lookup(treep->right_link, m);
}

TNode* nrLookup(TNode* treep, int m)
{
    while (treep != NULL)
    {
        if (m == treep->data)
            return treep;
        else if (m<treep->data)
            treep = treep->left_link;
        else
            treep = treep->right_link;
    }
    return NULL;
}

void delete_nodes(TNode *treep)
{
    if (treep != NULL)
    {
        delete_nodes(treep->left_link);
        if (treep->left_link != NULL)
        {
            delete treep->left_link;
            treep->left_link = NULL;
        }
        delete_nodes(treep->right_link);
        if (treep->right_link != NULL)
        {
            delete treep->right_link;
            treep->right_link = NULL;
        }
    }
}

void delete_tree(TNode*& root)
{
    TNode *treep = root;
    delete_nodes(root);
    delete(treep);
    root = NULL;
    cout << "The tree has been deleted." << endl << endl;
}


double averageTimeRatio (vector<double> a, vector<double> b)
{
    double sum1, sum2;
    for (size_t i=0; i<a.size(); i++)
    {
        sum1 += a[i];
        sum2 += b[i];
    }
    
    return sum1/sum2;
}
 
int main()
{
    TNode *root = NULL;
    TNode *newp;
    int n;
    string fname, line;
    vector<double> lookupTimes;
    vector<double> nrLookupTimes;
    vector<int> treeValues;
    
    cout << "Enter the name of the input file" << endl;
    cin >> fname;
    
    ifstream fin(fname.c_str());
    ofstream fout("output.txt");
    
    while (getline(fin, line))
    {
        cout << "In case of " << line << " nodes:" << endl << endl;
        fout << "In case of " << line << " nodes:" << endl << endl;
        
        n = atoi(line.c_str());
        
        for (int i=0; i<n; i++)
            treeValues.push_back(i);
        
        random_shuffle(treeValues.begin(), treeValues.end(), myrandom);
        
        root = create(treeValues[0]);
        for (int i = 1; i < n; i++)
        {
            newp = create(treeValues[i]);
            insert(root, newp);
        }
    
        cout << " The tree is ready." << endl;
    
        for (int i=0; i<5; i++)
        {
    
            clock_t start = clock();
        
            for (int j=0; j<n; j++)
            TNode* temp1 = lookup(root, j);
        
            clock_t stop = clock();
            
            lookupTimes.push_back((double) (1000 * ((double)stop - start) / CLOCKS_PER_SEC));
        
            clock_t start1 = clock();
        
            for (int j=0; j<n; j++)
                TNode* temp2 = nrLookup(root, j);
        
            clock_t stop1 = clock();
        
            nrLookupTimes.push_back((double) (1000 * ((double)stop1 - start1) / CLOCKS_PER_SEC));
        }
    
        cout << " Lookup and nrLookup times are ready." << endl;
    
        fout << "Lookup times are:" <<endl;
        for (size_t i=0; i<lookupTimes.size(); i++)
            fout << lookupTimes[i] << endl;
        fout << endl;
    
        fout << "nrLookup times are:" <<endl;
        for (size_t i=0; i<nrLookupTimes.size(); i++)
            fout << nrLookupTimes[i] << endl;
        fout << endl << endl;
    
        fout << "On an average the nrLookup routine is " << averageTimeRatio(lookupTimes, nrLookupTimes) << " times faster than the Lookup routine." <<endl;
        
        fout << endl;
        delete_tree(root);
        lookupTimes.clear();
        nrLookupTimes.clear();
        treeValues.clear();
    }

    cout << endl;
    return 0;
}
