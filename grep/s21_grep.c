#include "s21_grep.h"





int main(int argc, char **argv) {
struct flags flags = {0};
char search_reg[300][300]={{0}, {0}};

if (argc > 2) {
    if (parsing(argc, argv, &flags, search_reg) == 0) {
    print(argc, argv, &flags, search_reg);
    } else {printf("NO!!!!");}
    //     "usage: grep [-abcDEFGHhIiJLlmnOoqRSsUVvwxZ]
    // [-A num] [-B num] [-C[num]]\n[-e pattern] [-f file] [--binary-files=value]
    // [--color=when]\n[--context[=num]] [--directories=action]
    // [--label] [--line-buffered]\n[--null] [pattern] [file ...]");}
}
}



int parsing(int argc, char **argv, struct flags* flags, char search_reg[300][300]) {
int wrong = 0;
int flag_break = 0;
int flag_search = 0;
// int have_flag = 0;

for (int i = 1; i < argc; i++) {
if (flag_search == 1) {
    in_regex(argv, i, search_reg, flags);
    flag_search = 0;
}
    if (argv[i][0] == '-') {
        flag_break = 0;
        for (int j = 1; argv[i][j] != '\0'; j++) {
          if (argv[i][j] == 'e') {
              flags->e = 1;
              flag_break = 1;
              flag_search = 1;
          } else if (argv[i][j] == 'i') {
              flags->i = 1;
              flag_break = 1;
              flag_search = 1;

          } else if (argv[i][j] == 'v') {
              flags->v = 1;
              flag_break = 1;
              flag_search = 1;

          } else if (argv[i][j] == 'c') {
              flags->c = 1;
              flag_break = 1;
              flag_search = 1;

          } else if (argv[i][j] == 'l') {
              flags->l = 1;
              flag_break = 1;
              flag_search = 1;

          } else if (argv[i][j] == 'n') {
              flags->n = 1;
              flag_break = 1;
              flag_search = 1;

          } else {
                wrong = 1;
            }
        }

        if (flag_break == 1) {memset(argv[i], '\0', strlen(argv[i]));}
    }
}

if (search_reg[0][0] == '\0') {
in_regex(argv, 1, search_reg, flags);
}

return(wrong);
}









void print(int argc, char **argv, struct flags* flags, char search_reg[300][300]) {
regex_t regex;
FILE *stream;
char *line = NULL;
size_t len = 0;
int read;

int count_n = 0;
int count_c_found = 0;
int count_c_not_found = 0;
int check_files_num = count_files_for_open(argc, argv);

for (int i = 1; i < argc; i++) {
    if (argv[i][0] == '\0') {
        continue;}

    stream = fopen(argv[i], "r");
    if (stream == NULL) {
    printf("grep: %s: No such file or directory\n", argv[i]);
    continue;
    }

    count_n = 0;
    while ((read = getline(&line, &len, stream)) != -1) {
        count_n++;

        for (int reg=0; reg < flags->count_reg; reg++) {
            if (flags->i == 1)
                {regcomp(&regex, search_reg[reg], REG_ICASE);
            } else {
                regcomp(&regex, search_reg[reg], 0);}
            int success = regexec(&regex, line, 0, NULL, 0);
            regfree(&regex);
            if (flags->c || flags->l) {
                if (success == 0) {count_c_found++;}
                if (success == 1) {count_c_not_found++;}
            continue;
            }

            if (flags->v == 1) {
                if (success == 1) {
                    print_base(check_files_num, count_n, argv[i], line, flags);
                }
            } else if (success == 0) {print_base(check_files_num, count_n, argv[i], line, flags);}
        }
    }
    if (flags->l && count_c_found > 0) {
    printf("%s\n", argv[i]);
    count_c_found = 0;
    }

    if (flags->c && !flags->l) {
        print_c(count_c_found, count_c_not_found, check_files_num, flags, argv[i]);
        count_c_found = 0;
        count_c_not_found = 0;
    }
    fclose(stream);
}
    free(line);
}




void print_base(int check_files_num, int count_n, char *argv, char* line, struct flags* flags) {
if (flags->n) {
    if (check_files_num > 1) {
        printf("%s:%d:", argv, count_n);
        print_line(line);
    } else {
        printf("%d:", count_n);
        print_line(line);}
} else {
    if (check_files_num > 1) {
    printf("%s:", argv);
    print_line(line);
    } else {
        print_line(line);}
    }
}



void in_regex(char **argv, int i, char search_reg[300][300], struct flags* flags) {
for (int j = 0; argv[i][j] != '\0'; j++) {
    search_reg[flags->count_reg][j] = argv[i][j];
}

flags->count_reg++;
memset(argv[i], '\0', strlen(argv[i]));
}





void print_c(int count_c_found, int count_c_not_found, int check_files_num, struct flags* flags, char *argv) {
    if (check_files_num > 1) {
        if (flags->v) {
            printf("%s:%d\n", argv, count_c_not_found);
        } else {
            printf("%s:%d\n", argv, count_c_found);
        }
    } else {
        if (flags->v) {
            printf("%d\n", count_c_not_found);
        } else {
            printf("%d\n", count_c_found);
        }
    }
}




int count_files_for_open(int argc, char **argv) {
int check_files_num = 0;
for (int i = 1; i < argc; i++) {
    if (argv[i][0] == '\0') {continue;}
    check_files_num++;
}
return(check_files_num);
}





void print_line(char* line) {
for (size_t i = 0; i < strlen(line); i++) {
    printf("%c", line[i]);
}

if (line[strlen(line)-1] != '\n') {
    printf("\n");
}
}

