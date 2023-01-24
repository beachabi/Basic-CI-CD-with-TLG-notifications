#!/bin/bash/


#if bash ./tests.sh
#then
#	unswer+="YES"
#	unswer+="YES 1"
#fi

if bash ./tests.sh ;
          then unswer+=("Test for grep - SUCCESS")
          else unswer+=("Test for grep - FAIL")
          fi


echo ${unswer[0]}
echo ${unswer[1]}



#if bash ./test_cat.sh then unswer+=("Test for cat - SUCCESS") else unswer+=("Test for cat - FAIL") fi
