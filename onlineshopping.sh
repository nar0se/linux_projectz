#!/bin/bash

cart() 
{
printf " _____ \n"
printf " \___ \ \n"
printf "     \ \______A_C_M_E______EXPLOSIVE_ \n"
printf "      \ \___\\____\\_____\\__Deals___\ \n"
printf "       \ \___\\____\\_____\\______\\_/ \n"
printf "        \ \___\\____\\_____\\______\/ \n"
printf "         \ \___\\____\\_____\\_____/ \n"
printf "          \ \___\\____\\_____\\___/ \n"
printf "          //---------------------- \n"
printf "      ___//________________________ \n"
printf "     /  \                       /  \ \n"
printf "     \__/                       \__/ \n"
}

cart
figlet "ACME              Fresh"
printf " enter your Name\n" 
read name
printf " enter address\n" 
read addr
printf "enter phone number\n" 
read phone
printf " New Account created\n "

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
printf "Press 1 to continue shopping or 2 to checkout\n" 
read out 
if [ $out -eq 1 ]; then
main
else
echo "Check Out"
printf " please wait while your receipt is being printed\n"
sleep 4
echo "-----------------------------"
echo $(date)
printf "$name\n$phone\n$addr\n"
echo "----------------------------"
echo "Total items purchased: $(cat new.txt | wc -l)"
echo "---------------------------"
awk '{print $1,"$",$2*$3}' new.txt
echo "----------------------------"
echo "subtotal"
 awk '{s+=$2*$3}END{print "$",s}' new.txt
echo "-----------------------------"
echo "Total price with 3% tax:"
awk '{s+=$2*$3}END{print "$",(s*0.03)+s}' new.txt
echo "-------------------------------"
echo "-------------------------------"
printf "THANK YOU FOR SHOPPING\n"
printf "Your Item will be delivered within 24 hr of your order \n"
exit
fi
}

main
#declare -a price=( "1.25" "2.54" "4.56" "0.98" )

#options for produce
truncate -s 0 new.txt
until [ "$option" -gt 3 ]
do
while [ "$option" -eq 0 ]
do
declare -a array=( "Apple 1.25" "tomatoes 2.54" "spinach 4.56" "carrot 0.98" )
printf "Please select a choice.\n0:Apple -\t$ 1.25\n1:Tomatoes -\t$ 2.54\n2:spinach -\t$ 4.56\n3:carrot -\t$ 0.98"
read var
if [ $var -gt 3 ];
then
echo "Invalid choice."
break
fi
printf " Enter quantity\n "
read qty
for i in "${array[*]}"
do
#echo "${array[$var]} Added to cart" 
echo "${array[$var]}" "$qty" >> new.txt
awk -v q=$qty '{ print q,"lb",$1,"added to cart", $2*$3 }' new.txt 
break
done
break
done 


#options for Diary while true
while [ "$option" -eq 1 ]
do
declare -a diary=( "milk 3.25" "cheese 5.67" "eggs 6.87" "yogurt 7.34" )
printf "Please select a choice.\n0:Milk - \t$ 3.25\n1:Cheese - \t$ 5.67\n2:Egg - \t$ 6.87\n3:Yogurt - \t$ 7.34\n"
read key
if [ $key -gt 3 ];
then
echo "Invalid choice."
break
fi
printf " Enter quantity\n"
read qty
for i in "${diary[*]}"
do
#echo "${diary[$key]} Added to cart "
echo "${diary[$key]}" "$qty" >> new.txt
awk -v q=$qty '{ print q,"Pck",$1,"added to cart", $2*$3 }' new.txt
break
done
break
done

 #options for meat
while [ "$option" -eq 2 ]
do
declare -a meat=( "chicken 6.45" "salmon 12.56" "shrimp 8.67" )
printf "Please select a choice.\n0:Chicken - \t$ 6.45\n1:Salmon - \t$ 12.56\n2:shrimp - \t$ 8.67"
read rt
if [ $rt -gt 3 ];
then
echo "Invalid choice."
break
fi
printf " Enter quantity \n"
read qty
for i in "${meat[*]}"
do
#echo "${meat[$rt]} added to cart "
echo "${meat[$rt]}" "$qty" >> new.txt
awk -v q=$qty '{ print q," lb", $1,"added to cart", $2*$3 }' new.txt
break
done
break
done
shop 
done
echo " ------------------"

