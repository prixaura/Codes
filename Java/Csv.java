//
//  Csv.java
//  HW 2
//
//  Created by Prasanna Prakash on 5/19/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//

//----------IMPORTING PACKAGES-----------

import java.io.*;
import java.util.*;

//-----------CSV CLASS-------------------

public class Csv
{

    //----------PRIVATE ATTRIBUTES-------

	private BufferedReader in;
	private String fieldsep;
	private ArrayList<String> field;
    
    //----------CONSTRUCTORS-------------

	public Csv(BufferedReader inp)
	{
		this(inp, ",");
	}

	public Csv(BufferedReader inp, String separator)
	{
	        this.in = inp;
		this.fieldsep = separator;
	}
    
    //--GETLINE(): READS THE LINE AND SPLITS------------

	public String getline() throws IOException  
	{
		String line;

		line = in.readLine();
		if (line == null)
			return null;

		field = split(line, fieldsep);  

		return line;
	}

    //--SPLIT(): SPLITS ACCORDING TO THE FEILDSEPARATOR--

	private static ArrayList<String> split(String line, String separator)   
	{
		ArrayList<String> fields = new ArrayList<String>();    
		int i, j;                              

		if (line.length() == 0) 
			return fields;

		i = 0;
		do {
			if (i < line.length() && line.charAt(i) == '"')  
			{
				StringBuffer field = new StringBuffer();   
				j = advquoted(line, ++i, separator, field);      
				fields.add(field.toString());					
			}
			else                                          
			{		
				j = line.indexOf(separator, i);				
				if (j == -1)						
					j = line.length();					
				fields.add(line.substring(i, j));	
			}
			i = j + separator.length();
		} while (j < line.length()-1);

		return fields;
	}
	
    //--ADVQUOTED(): RETURN THE SEPARATOR INDEX FOR QUOTED VALUES-----

	private static int advquoted(String s, int i, String separator, StringBuffer field)  
	{
		int j;
		for (j = i; j < s.length() -1; j++)
		{
			if (s.charAt(j) == '"' && s.charAt(++j) != '"') {
				int k = s.indexOf(separator, j);
				if (k > s.length())
					k = s.length();
				for (k -= j; k-- > 0; )
					field.append(s.substring(j, k));
				//j = k;
				break;
			}
			field.append(s.charAt(j));
		}
		return j;
	}

    //--GETFIELD() RETURNS THE Nth FIELD----------

	public String getfield(int n)
	{
		return (String) field.get(n);
	}

    //--GETNFIELD(): RETURN THE NUMBER OF FIELDS--

	public int getnfield()
	{
		return field.size();
	}

    //--MAIN(): TESTS THE CSV CODE ON AN INPUT FILE-----

	public static void main(String[] args) throws IOException
	{
		Csv csv;
		String line;
	        BufferedReader in = new BufferedReader( new FileReader("input.txt"));

		csv = new Csv(in);
		long start = System.currentTimeMillis();
		while ((line = csv.getline()) != null)
		{
			System.out.println("line = `" + line + "'");
			for (int i = 0; i < csv.getnfield(); i++)
			{
				System.out.println("field[" + i + "] = `" + csv.getfield(i) + "'");
			}
		}
		long stop = System.currentTimeMillis();
		long time = (stop - start);
		System.out.println("Total time: " + time);
		in.close();
	}
}
