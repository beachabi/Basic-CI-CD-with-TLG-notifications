#!/bin/bash/

export SSHPASS=1
sshpass -e scp release/s21_cat user-1@192.168.88.225:/usr/local/bin
sshpass -e scp release/s21_grep user-1@192.168.88.225:/usr/local/bin
