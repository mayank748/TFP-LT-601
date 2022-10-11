#! /bin/bash -x

declare -A myDictionary

myDictionary["Bikes"]="Bobber"
myDictionary["Car"]="Sedan"
myDictionary["Bus"]="HSRTC"

echo "Before adding value"
echo ${myDictionary[@]}
echo ${myDictionary["Bikes"]}
echo ${!myDictionary[@]}

i=true
while $i
do
	read -p "Enter the key for dicitonary " key
	read -p "Enter the value for the respective key " value
	myDictionary[$key]=$value
	read -p "Do you want to continue(Press y for yes and n for no) " yesNo
	yesNo="${yesNo,,}"
	if [ $yesNo == n ]
	then
		i=false
	fi
done

echo "After adding value"
echo ${myDictionary[@]}
echo ${myDictionary["Bikes"]}
echo ${!myDictionary[@]}
