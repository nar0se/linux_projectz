#!/bin/bash

printItem(){
 echo "$1 - \$$2, Please select your next item"
}

produce=(Celery Tomatoes Lettuce Corn Grapes Oranges Pears Strawberries)
prices=(0.60 0.95 1.85 0.55 4.50 0.50 0.85 5.40)
echo "Here are your choices of produce: "
echo "----------------------------------"
counter=1
for p in ${produce[@]}
do
echo "$counter.$p"
((counter++))
done
echo "----------------------------------"
read -p "Choose your fruit or vegetable [1 - 8] >> " selection

case $selection in

1) printItem ${produce[0]} ${prices[0]};;
2) printItem ${produce[1]} ${prices[1]};;
3) printItem ${produce[2]} ${prices[2]};;
4) printItem ${produce[3]} ${prices[3]};;
5) printItem ${produce[4]} ${prices[4]};;
6) printItem ${produce[5]} ${prices[5]};;
7) printItem ${produce[6]} ${prices[6]};;
8) printItem ${produce[7]} ${prices[7]};;
*) echo "Invalid entry."
esac
