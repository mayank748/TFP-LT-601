#! /bin/bash -x

declare -a myArray
myArray[0]="Mayank"
myArray[1]=326


echo "before adding the some extra index value"
echo ${myArray[@]}
echo ${#myArray[@]}
echo ${!myArray[@]}
echo ${myArray[1]}

isAllowed=true
index=${#myArray[@]}
noCondition="n"
noOtherCondition="y"
noOtherYesCondition="yes"
while $isAllowed
do
	read -p "Enter the value " usrValue
	myArray[$index]=$usrValue
	read -p "Do you want to continue(Y for yes and n for no) " usrChoice
	usrChoice="${usrChoice,,}"
	echo $usrChoice
	if [ "$usrChoice" = "$noCondition" ]
	then
		isAllowed=false
	fi
	((index++))
done

echo "after adding the some extra index value"
echo ${myArray[@]}
echo ${#myArray[@]}
echo ${!myArray[@]}
echo ${myArray[1]}
