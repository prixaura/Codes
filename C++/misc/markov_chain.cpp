//------------------------------------------
//
//  markov1.cpp
//  HW 2
//
//  Created by Prasanna Prakash on 5/19/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//

//---------- HEADER FILES ------------------

#include <time.h>
#include <cstdlib>
#include <iostream>
#include <string>
#include <deque>
#include <map>
#include <vector>
#include <fstream>
#include <algorithm>

//------------------------------------------

using namespace std;

//---- GLOBAL VARIABLES --------------------

const int  NPREF = 2;                   // the maximum number of prefixes can be 2
const char NONWORD[] = "\n";            // cannot appear as real line: we remove newlines
const int  MAXGEN = 10000;              // maximum words generated

//------------------------------------------

typedef deque<string> Prefix;

map<Prefix, vector<string> > statetab; // prefix -> suffixes

//------- FUNCTION PROTOTYPES --------------

void		build(Prefix&, istream&);
void		generate(int nwords);
void		add(Prefix&, const string&);

//------------------------------------------

//---MAIN(): MARKOV RANDOM TEXT GENERATION -

int main(void)
{
    int	nwords = MAXGEN;
    Prefix prefix;                      // contains the prefix strings, 2 at a time
    vector < double > times;            // contains the times of markov chain output generations
    double total_time;
    srand((unsigned)time(0));
    
    cout << "Reading input from the file alice30.txt" << endl << endl;
    
    for ( int j=0; j<10; j++)
    {
        ifstream fin ("alice30.txt");   // reads input from a file
        
        clock_t start=clock();

        for (int i = 0; i < NPREF; i++)
            add(prefix, NONWORD);
        build(prefix, fin);
        add(prefix, NONWORD);
        generate(nwords);
    
        clock_t stop=clock();
        
        fin.close();
        times.push_back((double)(1000 * ((double)stop-start) / CLOCKS_PER_SEC));
    }
    
    for (int i=0; i<10; i++)
        total_time += times[i];
    
    cout << "The output has been generated in the file output1.txt" << endl << endl;
    
    cout << "On an average, using deque prefix and vector suffix took " << total_time / 10 << " milliseconds." << endl << endl;

    return 0;
}

// BUILD(): READ WORDS, BUILD STATE TABLE ---

void build(Prefix& prefix, istream& in)
{
    string buf;
    
    while (in >> buf)
    add(prefix, buf);
}

//------ADD(): UPDATE SUFFIX AND PREFIX -----

void add(Prefix& prefix, const string& s)
{
    if (prefix.size() == NPREF) {
        statetab[prefix].push_back(s);
        prefix.pop_front();
    }
    prefix.push_back(s);
}

//--GENERATE(): PRODUCE OUTPUT --------------
void generate(int nwords)
{
    Prefix prefix;
    int i;
    ofstream fout ("output1.txt");
    
    for (i = 0; i < NPREF; i++)
        add(prefix, NONWORD);
    
    for (i = 0; i < nwords; i++)
    {
        vector<string>& suf = statetab[prefix];
        const string& w = suf[rand() % suf.size()];
        if (w == NONWORD)
            break;
        fout << w << "\n";
        prefix.pop_front();	// advance
        prefix.push_back(w);
    }
    
    fout.close();
}

//-------------------------------------------
