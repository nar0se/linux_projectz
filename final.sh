#!/bin/bash

function showGraphic() {
	echo "
	echo "
	echo "
	echo "
	echo "
	echo "
	echo "
	echo "
	echo "
	echo "
	echo "
	echo "
	echo "
	echo "
	echo "
	echo "

}

read -p "Enter customers name " cust
read -p "Enter address " addr
read -p "Enter phone number " phone
echo "Account successfully created"

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
echo "Our food is always fresh."
else
echo " Invalid option : Try again "
fi
}

shop()
{
read -p "press 1 to continue shopping 2 to checkout" out 
if [ $out -eq 1 ]; then
main
else
echo "Check Out"
echo "-------------------------"
echo "Total items purchased: \$$(cat new.txt | wc -l)"
echo "-------------------------"
echo "$(cat new.txt)"
echo "--------------------------"
echo "Subtotal: \$$(awk '{s+=$2}END{print s}' new.txt)"
echo "--------------------------"
echo "Total price with 3% tax: \$$(awk '{s+=$2}END{print $(s*0.03)+s}' new.txt)" 
echo "---------------------------"


#tax=$(printf "%0.2f\n" $(echo "scale=2; $num*0.025" | bc))
#tax=`echo "$num*0.025" | bc -l`
#echo "$tax"
exit
fi
}

main
#declare -a array=( "Apple 1.25" "tomatoes 2.54" "spinach 4.56" "carrot 0.98" )

#options for produce
truncate -s 0 new.txt
until [ "$option" -gt 3 ]
do
while [ "$option" -eq 0 ]
do
declare -a array=( "Apple 1.25" "tomatoes 2.54" "spinach 4.56" "carrot 0.98" )
printf "Please select a choice.\n0:Apple\n1:Tomatoes\n2:Spinach\n3:Carrot "
read var
if [ $var -gt 3 ]
then
echo "Invalid choice."
break
fi
for i in "${array[*]}"
do
echo "${array[$var]} added to cart"
echo "${array[$var]}" >> new.txt
break
done
break
done 


#options for Diary while true
while [ "$option" -eq 1 ]
do
declare -a diary=( "milk 3.25" "cheese 5.67" "eggs 6.87" "yogurt 7.34" )
printf "Please select a choice.\n0:Milk\n1:Cheese\n2:Eggs\n3:Yogurt "
read key
if [ $key -gt 3 ]
then
echo "Invalid choice."
break
fi
for i in "${diary[*]}"
do
echo "${diary[$key]} added to cart "
echo "${diary[$key]}" >> new.txt
break
done
break
done

 #options for meat
while [ "$option" -eq 2 ]
do
declare -a meat=( "chicken 6.45" "salmon 12.56" "shrimp 8.67" )
printf "Please select a choice.\n0:Chicken\n1:Salmon\n2:Shrimp "
read rt
if [ $rt -gt 3 ]
then
echo "Invalid choice."
fi
for i in "${meat[*]}"
do
echo "${meat[$rt]} added to cart"
echo "${meat[$rt]}" >> new.txt
break
done
break
done
shop $out
done

