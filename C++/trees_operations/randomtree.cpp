//
//  randomtree.cpp
//  Lab 4
//
//  Created by Prasanna Prakash on 4/26/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//

#include <stdio.h>
#include <vector>
#include <algorithm>
#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int myrandom (int n) { return rand()%n; }

struct TNode
{
    int data;
    TNode *left_link;
    TNode *right_link;
};

void delete_nodes(TNode *treep)
{
    if(treep!=NULL)
    {
        delete_nodes(treep->left_link);
        if(treep->left_link!=NULL)
        {
            delete treep->left_link;
            treep->left_link=NULL;
        }
        delete_nodes(treep->right_link);
        if(treep->right_link!=NULL)
        {
            delete treep->right_link;
            treep->right_link=NULL;
        }
    }
}

void delete_tree(TNode*& root)
{
    TNode *treep=root;
    delete_nodes(root);
    delete(treep);
    root=NULL;
    
}

int count_nodes(TNode *treep)
{
    if(treep!=NULL)
    {
        int l,r;
        l=count_nodes(treep->left_link);
        r=count_nodes(treep->right_link);
        return l+r+1;
    }
    else
        return 0;
}

int compute_depth(TNode *treep)
{
    if(treep!=NULL)
    {
        int l,r,max;
        l=compute_depth(treep->left_link);
        r=compute_depth(treep->right_link);
        if(l>r)
            max=l;
        else
            max=r;
        return max+1;
    }
    else
        return -1;
}

TNode* create_node(int m)
{
    TNode *newp=new TNode;
    newp->data=m;
    newp->left_link=NULL;
    newp->right_link=NULL;
    return newp;
}

TNode* insert_new_delete_repeated(TNode* treep,TNode* newp)
{
    if(treep==NULL)
        return newp;
    if(newp->data == treep->data)
    {
        delete newp;
    }
    else if(newp->data < treep->data)
        treep->left_link=insert_new_delete_repeated(treep->left_link,newp);
    else
        treep->right_link=insert_new_delete_repeated(treep->right_link,newp);
    return treep;
}

TNode* lookup(TNode* treep, int m)
{
    while(treep!=NULL)
    {
        if(m==treep->data)
            return treep;
        else if (m<treep->data)
            treep=treep->left_link;
        else
            treep=treep->right_link;
    }
    return NULL;
}


int main()
{
    srand(unsigned(time(0)));
    int n;
    string line;
    TNode* root=NULL;
    TNode* newp;
    vector<int> numbers;
    
    ifstream fin ("input.txt");
    ofstream fout ("output.txt");
    
    while(getline(fin, line))
    {
        n = atoi(line.c_str());
        fout << "In case of n = " << n << " : " << endl << endl;
        
        for (int i=0; i<n; i++)
            numbers.push_back(i);
    
        random_shuffle(numbers.begin(), numbers.end(), myrandom);
    
        root = create_node(numbers[0]);
    
        for (int i=1; i<numbers.size(); i++)
        {
            newp = create_node(numbers[i]);
            insert_new_delete_repeated(root, newp);
        }
    
        fout << "Number of nodes inside the tree: ";
        int num_inserted=count_nodes(root);
        fout << num_inserted << endl;
        fout << endl;
    
        fout << "Height of the tree: ";
        fout << compute_depth(root) << endl;
        fout << endl;
    
        TNode* ptr=NULL;
        clock_t start=clock();
    
        for(int i=0;i<n;i++)
            ptr=lookup(root,i);
    
        clock_t stop=clock();
        fout << "Total search time: ";
        fout << 1000*((double)stop-start) /CLOCKS_PER_SEC << " milliseconds." << endl;
        fout << endl << endl;
    
        delete_tree(root);
        numbers.clear();
    }
    
    cout << "The outputs have been generated in output.txt" << endl;
    return 0;
}
