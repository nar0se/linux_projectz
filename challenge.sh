
#!/bin/bash

figlet "Welcome to this Challenge practice"

# This is a comment section.
# This is another comment.
# And yet another one.

echo "------------------------------------------------"
tr [a-z] [A-Z] < ~/Desktop/history.txt

echo "$HOME and $SHELL"

add(){
sum=$(($1 + $2))
echo "The sum of $1 and $2 is $sum"
} 

subtract(){
sub=$(($1 - $2))
echo "The subtraction of $1 and $2 is $sub"
}

multiply(){
mul=$(($1 * $2))
echo "The multiplication of $1 and $2 is $mul"
}

divide(){
div=`echo "scale=2; $1/$2" | bc`
echo "The division of $1 and $2 is $div"
}

read -p "add a number >>" num1
read -p "add another number >>" num2

add $num1 $num2
subtract $num1 $num2
multiply $num1 $num2
divide $num1 $num2


read -p "How old are you?" age
if [ $age -lt 20 ]; then
echo "You are under 20"
elif [[ $age -ge 20 ]] && [[ $age -le 29 ]]; then
echo "You are in yours 20s"
elif [ $age -gt 30 ]; then
echo "You are over 30"
elif [ $age -eq 20 ]; then
echo "You are 20"
elif [ $age -ne 65 ]; then
echo "You are old"
else
echo "Time doesn't slow down"
fi
 
test 85 -lt 75 && echo "Yes" || echo "No"

echo "Hello. What is your name?"
read VARNAME
echo "Glad to meet you, $VARNAME."

echo "Hello user. What is your login?"
read USER
echo "Welcome back, $USER."

echo "Enter password."
read PASSWD
username=narose
passwd=pass
if [ "$username" == "$USER" ] && [ "$passwd" == "$PASSWD" ]; then
echo "You're authenticated."
else
echo "You're not authenticated."
fi

line_number=1 
for x in 0 1 2 3 4 5
do
	echo "$line_number. The value is $x"
((line_number++))
done

echo "--------------------WHILE------------------------"

counter=2

while [ $counter -lt 22 ]
do
remainder=$(( $counter % 2 ))

if [ $remainder -eq 0 ]
then
echo $counter
fi

counter=$(($counter+2))
done

echo "--------------------UNTIL-----------------------"

counter=0

until [ $counter -ge 20 ]
do
if [[ $(( $counter % 2 )) -eq 1 ]]; then
echo "$counter"
fi
((counter++))
done

