//
//  main.cpp
//  traversal
//
//  Created by Prasanna Prakash on 4/25/15.
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

void inorder (TNode *treep , ostream &out)
{
    if (treep != NULL)
    {
        inorder(treep->left_link, out);
        out << treep->data << " ";
        inorder(treep->right_link, out);
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

int main()
{
    TNode *root = NULL;
    TNode *newp;
    int n;
    string fname, line;
    vector<int> treeValues;
    
    cout << "Enter the name of the input file" << endl;
    cin >> fname;
    
    ifstream fin(fname.c_str());
    ofstream fout("output.txt");
    
    while (getline(fin, line))
    {
        cout << "In case of " << line << " nodes:" << endl;
        fout << "In case of " << line << " nodes:" << endl;
        
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
        
        fout << "In-order traversal: \n\n";
        
        clock_t start = clock();
        inorder(root, fout);
        clock_t stop = clock();
        
        fout << endl << endl;
    
        cout << "In-order sorting took " << (1000*((double)stop-start)/CLOCKS_PER_SEC) << " milliseconds" << endl;
        
        fout << "Stl_sort: \n\n";
        
        clock_t start1 = clock();
        sort(treeValues.begin(), treeValues.end());
        clock_t stop1 = clock();
        
        for (int i=0; i<treeValues.size(); i++)
            fout << treeValues[i] << " ";
        
        fout << endl << endl;
        
        cout << "STL Sort took " << (1000*((double)stop1-start1)/CLOCKS_PER_SEC) << " milliseconds" << endl;
        delete_tree(root);
        treeValues.clear();
    }
    
    cout << endl;
    return 0;
}
