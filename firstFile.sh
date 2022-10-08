#! /bin/bash -x

#for loop

for((i=10;i>0;i=$((i/5))))
do
#body
	echo $i
done

echo "*************************while loop*************"
# while loop
i=10
j=0
q=1
while [[ $i -gt 0 && $j -eq 0 && $q -eq 1 ]]
do
	echo "Inside while loop"
	echo $i
	echo $j
	i=$(($i/5))
	((j++))
done


j=0
i=0
sum=0
while [[ $i -lt 10 || $j -lt 0 ]]
do
	echo "sample"
	sum=$i+1
	i=$(($sum))
	j=$(($j+1))
done









