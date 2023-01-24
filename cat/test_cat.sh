touch s21_cat.txt
touch cat.txt

function compare_cats () {
    if diff -q s21_cat.txt cat.txt >/dev/null; 
        then
            echo "Files are equal with flag $1!";
  
    	else
            echo "Files are different with flag $1!"
	    flag=1
        fi
}

function create_cats () {
    ./s21_cat $1 123.txt > s21_cat.txt
    cat $1 123.txt > cat.txt
}

create_cats -s
compare_cats -s

create_cats -b
compare_cats -b

create_cats -e
compare_cats -e

create_cats -n
compare_cats -n

create_cats -t
compare_cats -t

create_cats -v
compare_cats -v

create_cats -bensvt
compare_cats -bensvt


if [[ $flag -eq 1 ]];
then
	exit 1
fi
