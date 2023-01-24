#ifndef SRC_GREP_S21_GREP_H_
#define SRC_GREP_S21_GREP_H_
#define _POSIX_C_SOURCE 200809L

#include <stdio.h>
#include <string.h>
#include <regex.h>
#include <stdlib.h>

struct flags{
int e;
int i;
int v;
int c;
int l;
int n;
int count_reg;
};

int parsing(int argc, char **argv, struct flags* flags, char search_reg[300][300]);
void print(int argc, char **argv, struct flags* flags, char search_reg[300][300]);
void print_base(int check_files_num, int count_n, char *argv, char* line, struct flags* flags);
void in_regex(char **argv, int i, char search_reg[300][300], struct flags* flags);
void print_c(int count_c_found, int count_c_not_found, int check_files_num, struct flags* flags, char *argv);
int count_files_for_open(int argc, char **argv);
void print_line(char* line);

#endif  // SRC_GREP_S21_GREP_H_
