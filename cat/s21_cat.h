#ifndef SRC_CAT_S21_CAT_H_
#define SRC_CAT_S21_CAT_H_

#include <stdio.h>
#include <string.h>


struct flags {
int b;
int e;
int n;
int s;
int t;
int v;
};



int parsing_flags(char **argv, struct flags *flags);
void print_base(int argc, char **argv, struct flags *flags);

#endif  // SRC_CAT_S21_CAT_H_
