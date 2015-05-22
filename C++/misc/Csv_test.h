//
//  Csv_test.h
//  HW 2
//
//  Created by Prasanna Prakash on 5/20/15.
//  Copyright (c) 2015 Prixaurus. All rights reserved.
//

#ifndef HW_2_Header_h
#define HW_2_Header_h

extern char *csvgetline(FILE *f); /* read next input line */
extern char *csvfield(int n);	  /* return field n */
extern int csvnfield(void);		  /* return number of fields */

#endif
