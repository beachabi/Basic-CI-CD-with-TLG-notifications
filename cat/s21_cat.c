#include "s21_cat.h"


int main(int argc, char **argv) {
struct flags flags = {0};

if (argc > 1) {
if (parsing_flags(argv, &flags) == 1) {printf("wrong flag");
} else {
print_base(argc, argv, &flags);}
}
}  // close main





int parsing_flags(char **argv, struct flags *flags) {
int wrong = 0;


if (argv[1][0] == '-') {
    if (memcmp(argv[1], "--number-nonblank", 17) == 0) {
        flags->b = 1;
        } else if (memcmp(argv[1], "--number", 8) == 0) {
            flags->n = 1;
        } else if (memcmp(argv[1], "--squeeze-blank", 15) == 0) {
            flags->s = 1;
        } else {
        for (size_t i = 1; i < strlen(argv[1]); i++) {
            if (argv[1][i] == 'b') {
                flags->b = 1;
            } else if (argv[1][i] == 'e') {
                flags->e = 1;
                flags->v = 1;
            } else if (argv[1][i] == 'E') {
                flags->e = 1;
            } else if (argv[1][i] == 'n') {
                flags->n = 1;
            } else if (argv[1][i] == 's') {
                flags->s = 1;
            } else if (argv[1][i] == 'v') {
                flags->v = 1;
            } else if (argv[1][i] == 't') {
                flags->t = 1;
                flags->v = 1;
            } else if (argv[1][i] == 'T') {
                flags->t = 1;
            } else {
                wrong = 1;
                }
            }
        }
}
return (wrong);
}  // close parsing













void print_base(int argc, char **argv, struct flags *flags) {
int ch = 0;
int count = 0;
int count_line = 1;
int first_b = 1;
int first_n = 1;
int prev = '\n';
int count_s = 0;

if (argv[1][0] != '-') {
    count = 1;
} else {
    count = 2;
    }

for (; count < argc; count++) {
    FILE *file = fopen(argv[count], "r");
    if (file == NULL) {
        printf("cat: %s: No such file or directory\n", argv[count]);
        continue;
    }
    while ((ch = getc(file)) != EOF) {
            if (flags->s == 1 && ch == '\n' && prev == '\n') {
                count_s++;
                if (count_s > 1) {
                continue;}
                } else {count_s = 0;}
            if (flags->b == 1 && flags->n == 1) {
                    flags->n = 0;
            }

            if ((flags->n == 1) && (ch == '\n' || first_n == 1)) {
                if (first_n == 1) {printf("%6d\t", count_line); count_line++; first_n=0;}
                if (ch == '\n') {first_n = 1;}
            }

            if ((flags->b == 1) && (ch == '\n' || first_b == 1)) {
                if (ch != '\n') {
                    printf("%6d\t", count_line);
                    count_line++;
                    first_b = 0;
                } else {first_b = 1;}
            }

            if (flags->e == 1 && ch == '\n') {
            putchar('$');
            }

            if (flags->t == 1 && ch == '\t') {
            printf("^"); ch = 'I';
            }

            if (flags->v == 1) {
                if ((ch >= 0 && ch < 9) || (ch > 10 && ch < 32)) {
                    printf("^");
                    ch += 64;
                }
                if (ch == 127) {
                printf("^?");
                ch = getc(file);
                }
            }
        putchar(ch);
        prev = ch;
    }
    fclose(file);
}
}  // close print_base
