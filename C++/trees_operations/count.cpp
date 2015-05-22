//
//  main.cpp
//  trees
//
//  Created by Prasanna Prakash on 4/19/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//

#include <ctime>
#include <cstdlib>
#include <iostream>
using namespace std;

struct TNode
{
    int data;
    TNode *left_link;
    TNode *right_link;
};

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

void create_random_tree(TNode*& treep, int n)
{
    srand((unsigned)time(NULL));
    treep=create_node(rand()%n);
    TNode* newp;
    
    for(int i=0;i<n-1;i++)
    {
        newp=create_node(rand()%n);
        insert_new_delete_repeated(treep,newp);
    }
    
}

int main()
{
    
    int n;
    cout << "Enter the size of the range of random numbers: ";
    cin >> n;
    cout << endl;
    
    TNode* root=NULL;

    create_random_tree(root,n);
    
    cout << "Number of different random numbers generated in the range of " << n << ": ";
    int num_inserted=count_nodes(root);
    cout << num_inserted << endl;
    cout << endl;
    
    return 0;
}

