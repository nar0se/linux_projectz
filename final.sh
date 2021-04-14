#!/bin/bash


showGraphic() {
echo " _____"
echo " \___ \"
echo "	   \ \______A_C_M_E______EXPLOSIVE_"
echo "      \ \___\\____\\_____\\__Deals___\"
echo "       \ \___\\____\\_____\\______\\_/"
echo "	      \ \___\\____\\_____\\______\/"
echo "         \ \___\\____\\_____\\_____/"
echo "          \ \___\\____\\_____\\___/"
echo "          //----------------------"
echo "      ___//________________________"
echo "     /  \                       /  \"
echo "     \__/                       \__/"

}

showGraphic

sleep 2


figlet ACME Stores
echo "Where fresh is always delivered to your doorstep."
echo "-------------------------------------------------"
read -p "Please enter your name. " cust
echo "-------------------------------------------------"
read -p "Enter your address. " addr
echo "-------------------------------------------------"
read -p "Enter your phone number. " phone
echo "-------------------------------------------------"
echo "Account successfully created."
echo "-------------------------------------------------"

# function main
main() 
{
declare -a menu=( produce dairy meat )
for i in "${!menu[@]}"
do
echo "Select your choice -----$i" "${menu[$i]}"
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
read -p "Press 1 to continue shopping or 2 to checkout." out 
if [ $out -eq 1 ]; then
main
else
echo "Check Out"
echo "-------------------------"
echo "Total items purchased: $(cat new.txt | wc -l)"
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
printf "Please select a choice.\n0:Apple -\t$ 1.25\n1:Tomatoes -\t$ 2.54\n2:Spinach -\t$ 4.56\n3:Carrot -\t$ 0.98\n"
read var
if [ $var -gt 3 ]
then
echo "Invalid choice."
break
fi
for i in "${array[*]}"
do
echo "${array[$var]} Added to cart"
echo "${array[$var]}" >> new.txt
break
done
break
done 


#options for Diary while true
while [ "$option" -eq 1 ]
do
declare -a diary=( "milk 3.25" "cheese 5.67" "eggs 6.87" "yogurt 7.34" )
printf "Please select a choice.\n0:Milk - \t$ 3.25\n1:Cheese - \t$ 5.67\n2:Eggs - \t$ 6.87\n3:Yogurt - \t$ 7.34\n "
read key
if [ $key -gt 3 ]
then
echo "Invalid choice."
break
fi
for i in "${diary[*]}"
do
echo "${diary[$key]} Added to cart "
echo "${diary[$key]}" >> new.txt
break
done
break
done

 #options for meat
while [ "$option" -eq 2 ]
do
declare -a meat=( "chicken 6.45" "salmon 12.56" "shrimp 8.67" )
printf "Please select a choice.\n0:Chicken - \t$ 6.45\n1:Salmon - \t$ 12.56\n2:Shrimp - \t$ 8.67\n "
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

