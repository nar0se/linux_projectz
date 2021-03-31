#!/bin/bash
# function main
main() 
{
declare -a menu=( produce dairy meat )
for i in "${!menu[@]}"
do
echo "select your choice -----$i" "${menu[$i]}"
done
read option
if [ $option -le 2 ] && [ $option -ge 0 ];
then
echo "Happy shopping"
else
echo " Invalid option : Try again "
fi

}
main
#declare -a array=( "Apple 1.25" "tomatoes 2.54" "spinach 4.56" "carrot 0.98" )

#options for produce
truncate -s 0 new.txt
while [ $option -eq 0 ]
do
declare -a array=( "Apple 1.25" "tomatoes 2.54" "spinach 4.56" "carrot 0.98" )
read -p " press 0:Apple 1:tomatoes 2:spinach 3:carrot " var 
for i in "${array[*]}"
do
 echo "${array[$var]} added to cart"
echo "${array[$var]}" >> new.txt 
done
read -p "press 1 to continue shopping 2 to checkout" i
if [ $i -eq 1 ]; then
main
else
echo "checkout"
break
fi
done

#options for Diary while true

while [ "$option" -eq 1 ]
do
declare -a diary=( "milk 3.25" "cheese 5.67" "eggs 6.87" "yogurt 7.34" )
read -p "press 0:milk 1:cheese  2:eggs 3:yogurt " key
for i in "${diary[*]}"
do
echo "${diary[$key]} added to cart "
echo "${diary[$key]}" >> new.txt 
done
read -p "press 1 to continue shopping 2 to checkout" i
if [ $i -eq 1 ]; then
main
else
echo "checkout"
fi 
done

 #options for meat
while [ "$option" -eq 2 ]
do
declare -a meat=( "chicken 6.45" "salmon 12.56" "shrimp 8.67")
read -p "press 0:chicken 1:salmon 2:shrimp " rt
for i in "${meat[*]}"
do
echo "${meat[$rt]} added to cart"
echo "${meat[$rt]}" >> new.txt
done
read -p "press 1 to continue shopping 2 to checkout" i
if [ $i -eq 1 ]; then
main
else
echo "checkout"
fi
echo "Total items purchased $(cat new.txt | wc -l)"
echo "$(cat new.txt)"
done
