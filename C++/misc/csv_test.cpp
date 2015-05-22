//
//  csv_test.cpp
//  HW 2
//
//  Created by Prasanna Prakash on 5/19/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//
//-------HEADER FILES----------------

#include <iostream>
#include <algorithm>
#include <ctype.h>
#include <string>
#include <vector>
#include <fstream>

//-----------------------------------

using namespace std;

//--------CSV CLASS------------------

class Csv
{
public:
    Csv(istream& fin = cin, string sep = ",") :
    fin(fin), fieldsep(sep) {}
    
    string & operator[](int n);
    int getline(string& str);
    string getfield(int n);
    int getnfield() const { return nfield; }
    
    
private:
    istream& fin;            //INPUT FILE POINTER
    string line;             //INPUT LINE
    vector<string> field;    //FIELD STRINGS
    int nfield;              //NUMBER OF FIELDS
    string fieldsep;         //SEPERATOR CHARACTERS
    
    int split();
    int endofline(char);
    int advplain(const string& s, string& fld, int i); int advquoted(const string& s, string& fld, int i);
};

//-GETLINE():GET ONE LINE AND GROW AS NEEDED-----
        
int Csv::getline(string& str)
{
    char c;
            
    for (line = ""; fin.get(c) && !endofline(c); )
        line += c;
    
    split();
    str = line;
    return !fin.eof();
}

//-SPLIT():SPLIT LINES INTO FIELDS---------------
        
int Csv::split()
{
    string fld; int i, j;
            
    nfield = 0;
    if (line.length() == 0)
        return 0;
    
    i = 0;
    do
    {
        if (i < line.length() && line[i] == '"')
	    j = advquoted(line, fld, ++i);	   //SKIP QUOTE
        else
            j = advplain(line, fld, i);
        if (nfield >= field.size())
            field.push_back(fld);
        else
            field[nfield] = fld;
        nfield++;
        i = j + 1;
    } while (j < line.length());
            
    return nfield;
}

//-ADVQUOTED():RETURNS SEPERATOR INDEX FOR QUOTED FIELDS---

int Csv::advquoted(const string& s, string& fld, int i)
{
    int j;
            
    fld = "";
    for (j = i; j < s.length(); j++) {
        if (s[j] == '"' && s[++j] != '"') {
            int k = s.find_first_of(fieldsep, j);
            if (k > s.length()) // no separator found
                k = s.length();
            for (k -= j; k-- > 0; )
                fld += s[j++];
            break;
        }
        fld += s[j];
    }
    return j;
}

//-ADVPLAIN():RETURNS SEPERATOR INDEX FOR PLAIN FIELD---
        
int Csv::advplain(const string& s, string& fld, int i)
{
    int j;
            
    j = s.find_first_of(fieldsep, i);
    if (j > s.length())
        j = s.length();
    fld = string(s, i, j-i);
    return j;
}

//-GETFIELD():RETURN N-TH FIELD------------------------
        
string Csv::getfield(int n)
{
    if (n < 0 || n >= nfield)
        return "";
    else
        return field[n];
}

//-ENDOFFILE():CHECK FOR THE END OF THE FILE-----------
        
int Csv::endofline(char c)
{
    int eol;
            
    eol = (c=='\r' || c=='\n');
    if (c == '\r')
    {
        fin.get(c);
        if (!fin.eof() && c != '\n')
            fin.putback(c);
    }
    return eol;
}

//-MAIN():CHECKS THE CSV CLASS FOR AN INPUT FILE-------            
int main(void)
{
    ifstream infile ("input.txt");
    string line; 
    Csv csv(infile,",");          // PASSES INFILE TO FIN
                
    while (csv.getline(line) != 0)
    {
        cout << "line = ‘" << line <<"’\n";
        for (int i = 0; i < csv.getnfield(); i++)
            cout << "field[" << i << "] = `" << csv[i] << "'\n";
	cout << endl;
    }
    infile.close();
    return 0;
}

//-OPERATOR[]:SUBSCRIPT OPERATOR OVERLOADING----------

string & Csv::operator[](int n)
{
    return field[n];
}

//----------------------------------------------------
