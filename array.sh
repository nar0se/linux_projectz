#!/bin/bash
read -p "Enter customers name " cust[3]
#sudo useradd $cust 
#if [ $? -ne 0 ];
#then
#echo " You already have an account with us so ur eligible for 20% discount"
#exit 1
#else
#echo " new account created "
read -p "enter addr" addr[10]
read -p "enter phone num " phone
#fi

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

shop()
{
read -p "press 1 to continue shopping 2 to checkout" out 
if [ $out -eq 1 ]; then
main
else
echo "check out"
echo "-------------------------"
echo "Total items purchased $(cat new.txt | wc -l)"
echo "-------------------------"
echo "$(cat new.txt)"
echo "--------------------------"
echo "total cost = $(awk '{s+=$2}END{print s}' new.txt)"
echo "--------------------------"
echo "total price after 2.5% tax = $(awk '{s+=$2}END{print (s*0.025)+s}' new.txt)" 
echo "---------------------------"


#tax=$(printf "%0.2f\n" $(echo "scale=2; $num*0.025" | bc))
#tax=`echo "$num*0.025" | bc -l`
#echo "$tax"
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
declare -a price=( "1.25" "2.54" "4.56" "0.98" )
declare -a array=( "Apple ==> 1.25" "tomatoes ==> 2.54" "spinach ==> 4.56" "carrot ==> 0.98" )
printf "press:   0 -----> Apple - $ 1.25\n\t 1 -----> Tomatoes - $ 2.54\n\t 2 ----> spinach - $ 4.56 \n\t 3 -----> carrot - $ 0.98 \n" 
read var 
read -p "enter qunty" qty
echo " $(awk 'PRINT {$qty * $price[$var]}')"
for i in "${array[*]}"
do
echo "$qty lb of ${array[$var]} added to cart "
echo "${array[$var]}" >> new.txt
break
done
break
done 


#options for Diary while true

while [ "$option" -eq 1 ]
do
declare -a diary=( "milk ===> 3.25" "cheese ===> 5.67" "eggs ===> 6.87" "yogurt ===> 7.34" )
printf "press: 0 -----> milk\n\t1 -----> cheese\n\t2 -----> eggs\n\t3 -----> yogurt\n " 
read key
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
declare -a meat=( "chicken 6.45" "salmon 12.56" "shrimp 8.67")
read -p "press 0:chicken 1:salmon 2:shrimp " rt
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
#echo "check out"
#echo "Total items purchased $(cat new.txt | wc -l)"
#echo "$(cat new.txt)"
#echo "total cost is"
#echo "-----------------------"
#awk '{s+=$2}END{print s}' new.txt

