//
//  main.cpp
//  Lab 4
//
//  Created by Prasanna Prakash on 4/26/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//

#include <ctime>
#include <cstdlib>
#include <iostream>
#include <fstream>
#include <vector>
#include <string>

using namespace std;

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

void trace_depth ( TNode *treep, int &d )
{
    if (treep != NULL)
    {
        cout << "Data field " << treep->data;
        cout << ", depth " << d << endl;
        d++;
        trace_depth(treep->left_link, d);
        trace_depth(treep->right_link, d);
        d--;
    }
}

TNode* insert_new_delete_repeated(TNode* treep,TNode* newp, int& num_deleted)
{
    if(treep==NULL)
        return newp;
    if(newp->data == treep->data)
    {
        cout << treep->data << " already exists. It won't be inserted." << endl;
        num_deleted++;
        delete newp;
    }
    else if(newp->data < treep->data)
        treep->left_link=insert_new_delete_repeated(treep->left_link,newp,num_deleted);
    else
        treep->right_link=insert_new_delete_repeated(treep->right_link,newp,num_deleted);
    return treep;
}

void preorder ( TNode *root)
{
    if ( root != NULL )
    {
        cout << root->data << " ";
        preorder( root->left_link );
        preorder( root->right_link );
    }
}

void inorder ( TNode *root)
{
    if ( root != NULL )
    {
        inorder( root->left_link );
        cout << root->data << " ";
        inorder( root->right_link );
    }
}

void postorder ( TNode *root)
{
    if ( root != NULL )
    {
        postorder( root->left_link );
        postorder( root->right_link );
        cout << root->data << " ";

    }
}


int main()
{
    
    string line;
    TNode* root=NULL;
    TNode* newp;
    int num_deleted=0;
    vector<int> numbers;
    
    ifstream fin ( "in.txt" );
    
    while (getline(fin, line))
        numbers.push_back(atoi(line.c_str()));
    
    /*cout << "Enter a positive integer ( 0 to stop ) : ";
    cin >> n;
    cout << endl;*/
    
    if (numbers[0]!=0)
        root = create_node(numbers[0]);
    
    for (int i=1; i<numbers.size(); i++)
    {
        if (numbers[i] == 0)
            break;
        else
        {
            newp = create_node(numbers[i]);
            insert_new_delete_repeated(root, newp, num_deleted);
        }
    }
    
    cout << "Pre order traversal : " << endl;
    preorder(root);
    cout << endl << endl;
    
    cout << "In order traversal : " << endl;
    inorder(root);
    cout << endl << endl;

    cout << "Post order traversal : " << endl;
    postorder(root);
    cout << endl << endl;
    
    cout << "Number of nodes inside the tree: ";
    int num_inserted=count_nodes(root);
    cout << num_inserted << endl;
    cout << endl;
    
    cout << "Height of the tree: ";
    cout << compute_depth(root) << endl;
    cout << endl;
    
    cout << "Number of deleted nodes: ";
    cout << num_deleted << endl;
    cout << endl;
    
    cout << "Pre order with depth tracing : " << endl;
    int d=0;
    trace_depth(root, d);
    cout << endl;
    
    delete_tree(root);
    cout << "The tree has been deleted." << endl;
    
    return 0;
}
