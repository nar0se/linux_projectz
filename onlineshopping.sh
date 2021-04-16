#!/bin/bash

cart() 
{
printf " _____ \n"
printf " \___ \ \n"
printf "     \ \______A_C_M_E___EXPLOSIVE___ \n"
printf "      \ \___\\____\\_____\\__Deals____/ \n"
printf "       \ \___\\____\\_____\\______\\__/ \n"
printf "        \ \___\\____\\_____\\______\/ \n"
printf "         \ \___\\____\\_____\\_____/ \n"
printf "          \ \___\\____\\_____\\___/ \n"
printf "          //---------------------- \n"
printf "      ___//________________________ \n"
printf "     /  \                       /  \ \n"
printf "     \__/                       \__/ \n"
}
cart
sleep 1
figlet "      ACME     Stores"
echo "-------------------------------"
printf "Please enter your name\n"
read name
echo "-------------------------------"
printf "Enter your address\n"
read addr
echo "-------------------------------"
printf "Enter your phone number\n"
read phone
echo "-------------------------------"
printf "Account sucessfully created\n"
echo "-------------------------------"

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
echo "-------------------------------"
else
echo "Invalid option : Try again "
fi
}

shop()
{

awk -v q=$qty '{print q,"lb",$1,"added to cart", $2*$3 }' new.txt 
break
printf "Press 1 to continue shopping or 2 to checkout\n" 
read out 
if [ $out -eq 1 ]; then
#awk -v q=$qty '{print q,"lb",$1,"added to cart", $2*$3 }' new.txt 
main
else
echo "Checking out"
printf "Please wait while your receipt is being printed\n"
sleep 4
echo "-----------------------------"
echo $(date)
printf "$name\n$phone\n$addr\n"
echo "----------------------------"
echo "Total items purchased: $(cat new.txt | wc -l)"
echo "---------------------------"
awk '{print $1,"$",$2*$3}' new.txt
echo "----------------------------"
echo "Subtotal"
awk '{s+=$2*$3}END{print "$",s}' new.txt
echo "-----------------------------"
echo "Total price with 3% tax:"
awk '{s+=$2*$3}END{print "$",(s*0.03)+s}' new.txt
echo "-------------------------------"
echo "-------------------------------"
printf "Thank you for your patronage \n"
printf "Your items will be delivered within 24 hours \n"
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
declare -a array=( "Apples 1.25" "Tomatoes 2.54" "Spinach 4.56" "Carrots 0.98" "Ginger 2.22" "Oranges 2.49" )
printf "Please select a choice.\n0:Apples -\t$ 1.25\n1:Tomatoes -\t$ 2.54\n2:Spinach -\t$ 4.56\n3:Carrots -\t$ 0.98\n4:Ginger - \t$ 2.22\n5:Oranges - \t$ 2.49\n"
read var
if [ $var -gt 6 ];
then
echo "Invalid choice."
break
fi
printf "Enter quantity\n"
read qty
for i in "${array[*]}"
do
#echo "${array[$var]} Added to cart" 
echo "${array[$var]}" "$qty" >> new.txt
break
done
#awk -v q=$qty '{print q,"lb",$1,"added to cart", $2*$3 }' new.txt 
break
done
 


#options for Diary while true
while [ "$option" -eq 1 ]
do
declare -a diary=( "Milk 3.25" "Cheese 5.67" "Eggs 6.87" "Yogurt 7.34" "Butter 0.99" "SourCream 3.89" )
printf "Please select a choice.\n0:Milk - \t$ 3.25\n1:Cheese - \t$ 5.67\n2:Egg - \t$ 6.87\n3:Yogurt - \t$ 7.34\n4:Butter -\t$ 0.99\n5:SourCream -\t$ 3.89\n"
read key
if [ $key -gt 6 ];
then
echo "Invalid choice."
break
fi
printf "Enter quantity\n"
read oqty
for i in "${diary[*]}"
do
#echo "${diary[$key]} Added to cart "
echo "${diary[$key]}" "$qty" >> new.txt
break
done
#awk -v q=$qty '{print q,"Pack",$1,"added to cart", $2*$3 }' new.txt
break
done

 #options for meat
while [ "$option" -eq 2 ]
do
declare -a meat=( "chicken 6.45" "salmon 12.56" "shrimp 8.67" "scallops 11.33" "ground beef 4.55" "pork 3.98" )
printf "Please select a choice.\n0:Chicken - \t$ 6.45\n1:Salmon - \t$ 12.56\n2:shrimp - \t$ 8.67\n3:Scallops - \t$ 11.33\n4:GroundBeef - \t$ 4.55\n5:Pork - \t$ 3.98\n"
read rt
if [ $rt -gt 6 ];
then
echo "Invalid choice."
break
fi
printf "Enter quantity \n"
read sqty
for i in "${meat[*]}"
do
#echo "${meat[$rt]} added to cart "
echo "${meat[$rt]}" "$qty" >> new.txt
break
done
#awk -v q=$qty '{print q,"lb", $1,"added to cart", $2*$3 }' new.txt
break
done
shop
done
echo " ------------------"


