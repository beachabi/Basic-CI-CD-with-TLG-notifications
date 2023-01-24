#!/bin/bash

counter_test=0
counter_success=0
counter_fail=0

str=""
str21=""


result() {
  let counter_test=$(( counter_test + 1 ))
    if [ "$str" == "$str21" ]
    then
	    echo 'Success!'
      let counter_success=$(( counter_success + 1 ))
    else
	    echo 'Fail!'
      let counter_fail=$(( counter_fail + 1 ))
    fi
}

file_1="test_1.txt"
file_2="test_2.txt"
pattern_file="pattern_file.txt"
pattern="what"

echo -ne 'test -e: '
str=$(grep -e $pattern $file_1 $file_2)
str21=$(./s21_grep -e $pattern $file_1 $file_2)
result

echo -ne 'test -e: '
str=$(grep $pattern $file_1 $file_2)
str21=$(./s21_grep $pattern $file_1 $file_2)
result

# echo -ne 'test -f'$flag1$flag2': '
# str=$(grep -f $pattern_file $file_1 $file_2)
# str21=$(./s21_grep -f $pattern_file $file_1 $file_2)
# result

for flag1 in i v c l n; do
  for flag2 in i v c l n; do
    if [ "$flag1" != "$flag2" ]
    then
      echo -ne 'test '$flag1$flag2': '
      str=$(grep -$flag1$flag2 $pattern $file_1 $file_2)
      str21=$(./s21_grep -$flag1$flag2 $pattern $file_1 $file_2)
      result
    else
      echo -ne 'test ' $flag1': '
      str=$(grep -$flag1 $pattern $file_1 $file_2)
      str21=$(./s21_grep -$flag1 $pattern $file_1 $file_2)
      result
    fi
  done
done

for flag1 in i v c l n; do
  for flag2 in i v c l n; do
    if [ "$flag1" != "$flag2" ]
    then
      echo -ne 'test 1 file '$flag1$flag2': '
      str=$(grep -$flag1$flag2 $pattern $file_1)
      str21=$(./s21_grep -$flag1$flag2 $pattern $file_1)
      result
    else
      echo -ne 'test ' $flag1': '
      str=$(grep -$flag1 $pattern $file_1)
      str21=$(./s21_grep -$flag1 $pattern $file_1)
      result
    fi
  done
done






echo -ne '-----WRONG PATTERN-----\n'



str=""
str21=""

result() {
  let counter_test=$(( counter_test + 1 ))
    if [ "$str" == "$str21" ]
    then
	    echo 'Success!'
      let counter_success=$(( counter_success + 1 ))
    else
	    echo 'Fail!'
      let counter_fail=$(( counter_fail + 1 ))
    fi
}

file_1="test_1.txt"
file_2="test_2.txt"
pattern_file="pattern_file.txt"
pattern="what"

echo -ne 'test -e: '
str=$(grep -e $pattern $file_1 $file_2)
str21=$(./s21_grep -e $pattern $file_1 $file_2)
result

echo -ne 'test -e: '
str=$(grep $pattern $file_1 $file_2)
str21=$(./s21_grep $pattern $file_1 $file_2)
result



for flag1 in i v c l n; do
  for flag2 in i v c l n; do
    if [ "$flag1" != "$flag2" ]
    then
      echo -ne 'test '$flag1$flag2': '
      str=$(grep -$flag1$flag2 $pattern $file_1 $file_2)
      str21=$(./s21_grep -$flag1$flag2 $pattern $file_1 $file_2)
      result
    else
      echo -ne 'test ' $flag1': '
      str=$(grep -$flag1 $pattern $file_1 $file_2)
      str21=$(./s21_grep -$flag1 $pattern $file_1 $file_2)
      result
    fi
  done
done

for flag1 in i v c l n; do
  for flag2 in i v c l n; do
    if [ "$flag1" != "$flag2" ]
    then
      echo -ne 'test 1 file '$flag1$flag2': '
      str=$(grep -$flag1$flag2 $pattern $file_1)
      str21=$(./s21_grep -$flag1$flag2 $pattern $file_1)
     
      result
    else
      echo -ne 'test ' $flag1': '
      str=$(grep -$flag1 $pattern $file_1)
      str21=$(./s21_grep -$flag1 $pattern $file_1)
      result
     
    fi
  done
done

























echo -ne '-----WRONG PATTERN-----\n'



str=""
str21=""

result() {
  let counter_test=$(( counter_test + 1 ))
    if [ "$str" == "$str21" ]
    then
	    echo 'Success!'
      let counter_success=$(( counter_success + 1 ))
    else
	    echo 'Fail!'
      let counter_fail=$(( counter_fail + 1 ))
    fi
}

file_1="test_1.txt"
file_2="test_2.txt"
pattern_file="pattern_file.txt"
pattern="what"



# echo -ne 'test -f'$flag1$flag2': '
# str=$(grep -f $pattern_file $file_1 $file_2)
# str21=$(./s21_grep -f $pattern_file $file_1 $file_2)
# result

for flag1 in i v c l n; do


      echo -ne 'test '$flag1': '
      str=$(grep -$flag1 $pattern $file_1 $file_2)
      str21=$(./s21_grep -$flag1 $pattern $file_1 $file_2)
      result
   
done














str=""
str21=""

result() {
  let counter_test=$(( counter_test + 1 ))
    if [ "$str" == "$str21" ]
    then
	    echo 'Success!'
      let counter_success=$(( counter_success + 1 ))
    else
	    echo 'Fail!'
      let counter_fail=$(( counter_fail + 1 ))
    fi
}

file_1="test_1.txt"
file_2="test_2.txt"
pattern_file="pattern_file.txt"
pattern="what"



# echo -ne 'test -f'$flag1$flag2': '
# str=$(grep -f $pattern_file $file_1 $file_2)
# str21=$(./s21_grep -f $pattern_file $file_1 $file_2)
# result

for flag1 in i v c l n; do


      echo -ne 'test '$flag1': '
      str=$(grep -$flag1 $pattern $file_1 $file_2)
      str21=$(./s21_grep -$flag1 $pattern $file_1 $file_2)
      result
   
done















echo -ne '-----1 flag - wrong options - 2 files -----\n'



str=""
str21=""

result() {
  let counter_test=$(( counter_test + 1 ))
    if [ "$str" == "$str21" ]
    then
	    echo 'Success!'
      let counter_success=$(( counter_success + 1 ))
    else
	    echo 'Fail!'
      let counter_fail=$(( counter_fail + 1 ))
    fi
}

file_1="test_1.txt"
file_2="test_2.txt"
pattern_file="pattern_file.txt"
pattern="yes"


echo -ne 'test -e: '
str=$(grep -e $pattern $file_1 $file_2)
str21=$(./s21_grep -e $pattern $file_1 $file_2)
result

echo -ne 'test -e: '
str=$(grep $pattern $file_1 $file_2)
str21=$(./s21_grep $pattern $file_1 $file_2)
result

# echo -ne 'test -f'$flag1$flag2': '
# str=$(grep -f $pattern_file $file_1 $file_2)
# str21=$(./s21_grep -f $pattern_file $file_1 $file_2)
# result

for flag1 in i v c l n; do


      echo -ne 'test '$flag1': '
      str=$(grep -$flag1 $pattern $file_1 $file_2)
      str21=$(./s21_grep -$flag1 $pattern $file_1 $file_2)
      result

done

















echo -ne '-----1 flag - wrong options - 1 file -----\n'



str=""
str21=""

result() {
  let counter_test=$(( counter_test + 1 ))
    if [ "$str" == "$str21" ]
    then
	    echo 'Success!'
      let counter_success=$(( counter_success + 1 ))
    else
	    echo 'Fail!'
      let counter_fail=$(( counter_fail + 1 ))
    fi
}

file_1="test_1.txt"
file_2="test_2.txt"
pattern_file="pattern_file.txt"
pattern="yes"

echo -ne 'test -e: '
str=$(grep -e $pattern $file_1)
str21=$(./s21_grep -e $pattern $file_1 )
result

echo -ne 'test -e: '
str=$(grep $pattern $file_1 )
str21=$(./s21_grep $pattern $file_1)
result

# echo -ne 'test -f'$flag1$flag2': '
# str=$(grep -f $pattern_file $file_1 $file_2)
# str21=$(./s21_grep -f $pattern_file $file_1 $file_2)
# result

for flag1 in i v c l n; do


      echo -ne 'test '$flag1': '
      str=$(grep -$flag1 $pattern $file_1)
      str21=$(./s21_grep -$flag1 $pattern $file_1)
      result
   
done























echo -ne '-----1 flag - correct options - 2 files -----\n'



str=""
str21=""

result() {
  let counter_test=$(( counter_test + 1 ))
    if [ "$str" == "$str21" ]
    then
	    echo 'Success!'
      let counter_success=$(( counter_success + 1 ))
    else
	    echo 'Fail!'
      let counter_fail=$(( counter_fail + 1 ))
    fi
}

file_1="test_1.txt"
file_2="test_2.txt"
pattern_file="pattern_file.txt"
pattern="what"

echo -ne 'test -e: '
str=$(grep -e $pattern $file_1 $file_2)
str21=$(./s21_grep -e $pattern $file_1 $file_2)
result

echo -ne 'test -e: '
str=$(grep $pattern $file_1 $file_2)
str21=$(./s21_grep $pattern $file_1 $file_2)
result

# echo -ne 'test -f'$flag1$flag2': '
# str=$(grep -f $pattern_file $file_1 $file_2)
# str21=$(./s21_grep -f $pattern_file $file_1 $file_2)
# result

for flag1 in i v c l n; do


      echo -ne 'test '$flag1': '
      str=$(grep -$flag1 $pattern $file_1 $file_2)
      str21=$(./s21_grep -$flag1 $pattern $file_1 $file_2)
      result
     
done










echo -ne '-----1 flag - correct options - 1 file -----\n'



str=""
str21=""

result() {
  let counter_test=$(( counter_test + 1 ))
    if [ "$str" == "$str21" ]
    then
	    echo 'Success!'
      let counter_success=$(( counter_success + 1 ))
    else
	    echo 'Fail!'
      let counter_fail=$(( counter_fail + 1 ))
    fi
}

file_1="test_1.txt"
file_2="test_2.txt"
pattern_file="pattern_file.txt"
pattern="what"


echo -ne 'test -e: '
str=$(grep -e $pattern $file_1)
str21=$(./s21_grep -e $pattern $file_1)
result

echo -ne 'test -e: '
str=$(grep $pattern $file_1)
str21=$(./s21_grep $pattern $file_1)
result
# echo -ne 'test -f'$flag1$flag2': '
# str=$(grep -f $pattern_file $file_1 $file_2)
# str21=$(./s21_grep -f $pattern_file $file_1 $file_2)
# result

for flag1 in i v c l n; do


      echo -ne 'test '$flag1': '
      str=$(grep -$flag1 $pattern $file_1)
      str21=$(./s21_grep -$flag1 $pattern $file_1)
      result

done










echo
echo 'Tests: '$counter_test
echo 'Success: '$counter_success
echo 'Fail: '$counter_fail

if [[ $counter_fail -ne 0 ]];
then
	exit 1
fi
