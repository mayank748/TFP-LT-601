
declare -A arr[10,10]

function assign()
{
	local k=100
	for ((i=9;i>=0;i--))
	do
		temp=$(($i % 2))
		if [ $temp = "1" ]
		then
		for((j=0;j<10;j++))
		do
			arr[$i,$j]=$k
			k=$(($k-1))
		done
		else
		for((j=9;j>=0;j--))
		do
		arr[$i,$j]=$k
		k=$(($k-1))
		done
		fi
	done
}
function roll_dice()
{
	position=$1
	echo "Player is at: "$position
	echo "Dice  value: "$dice
	echo "Press (r or R) roll the dice."
	read input
	if [ "$input" = "r" -o "$input" = "R" ]
	then
 		dice=$(($RANDOM%6+1))
	return  $dice
	else
		echo "Enter the correct choice"
		roll_dice
	fi
}

function print()
{
	clear
	point=$1
	echo "========================="\"Snake ladder gmae"\"==========================="
	for ((i=9;i>=0;i--))
	do
	echo "----------------------------------------------------------------------"
		for((j=0;j<10;j++))
		do
		if [ $j -eq 0 ]
		then
			echo -e "|\c"
		fi
		if [ $i -eq 9 -a $j -eq 0 ]
		then
			echo -e "\c"
		else
			echo -e " \c"
		fi
		if [ "${arr[$i,$j]}" = "$point" ]
		then
			echo -e "[_]\c"
		elif [ "${arr[$i,$j]}" = "4" -o "${arr[$i,$j]}" = "12" -o "${arr[$i,$j]}" = "14" -o "${arr[$i,$j]}" = "22" -o "${arr[$i,$j]}" = "41" -o "${arr[$i,$j]}" = "54" ]
		then
			echo -e " # \c"
		elif [ "${arr[$i,$j]}" = "28" -o "${arr[$i,$j]}" = "37" -o "${arr[$i,$j]}" = "94" -o "${arr[$i,$j]}" = "96" -o "${arr[$i,$j]}" = "75" -o "${arr[$i,$j]}" = "47" ]
		then
			echo -e "&  \c"
		elif [ "${arr[$i,$j]}" = "56" -o "${arr[$i,$j]}" = "50" -o "${arr[$i,$j]}" = "58" -o "${arr[$i,$j]}" = "79" -o "${arr[$i,$j]}" = "88" ]
		then
			echo -e "@  \c"
		elif [ "${arr[$i,$j]}" = "71" -o "${arr[$i,$j]}" = "42" -o "${arr[$i,$j]}" = "32" -o "${arr[$i,$j]}" = "16" -o "${arr[$i,$j]}" = "5" -o "${arr[$i,$j]}" = "10" ]
		then
			echo -e "!! \c"
		else
			echo -e "${arr[$i,$j]} \c"
		fi
		if [ $i -gt 0 -a $j -lt 9 ]
		then
			echo -e " | \c"
		elif [ $i -eq 0 -a $j -eq 4 ]
		then
			echo -e " |\c"
		else
			echo -e "  | \c"
		fi
		done
		echo " "
	done
	echo "----------------------------------------------------------------------"
	echo "The ladder by #, Snake by &, incremnt by @ and decrement by !!."
}

function condition_position_check()
{
	up=$1
	dice=$2
	updated_position=$(echo "$up" "$dice"|awk '{print($1+$2)}')
	echo "Player is awk  at: "$updated_position
	pos=$updated_position
	case $updated_position in
		4) echo "Player got ladder"
			updated_position=56
				;;
		12) echo "Player got ladder"
			updated_position=50
				;;
		14) echo "Player got ladder"
			updated_position=55
				;;
		22) echo "Player got ladder"
			updated_position=58
				;;
		28) echo "Player got Snake"
			updated_position=10
				;;
		37) echo "Player got Snake"
			updated_position=3
				;;
		41) echo "Player got ladder"
			updated_position=79
				;;
		54) echo "Player got ladder"
			updated_position=88
				;;
		75) echo "Player got Snake"
			updated_position=32
				;;
		94) echo "Player got Snake"
			updated_position=71
				;;
		96) echo "Player got Snake"
			updated_position=42
				;;
		*) updated_position=0
				;;
		esac

		if [ "$updated_position" = "0" ]
		then
			return $pos
		else
			return $updated_position
		fi
}


function win_condition()
{
	local win=$1
	if [ $win -eq 100 ]
	then
		echo "Player Won"
		exit
	fi
	if [ $win -gt 100 ]
	then
		win=$(($win-$dice))
			return $win
	else
			return $win
	fi
}

assign

declare -A arr[10,10]

function assign()
{
	local k=100
	for ((i=9;i>=0;i--))
	do
		temp=$(($i % 2))
		if [ $temp = "1" ]
		then
		for((j=0;j<10;j++))
		do
			arr[$i,$j]=$k
			k=$(($k-1))
		done
		else
		for((j=9;j>=0;j--))
		do
		arr[$i,$j]=$k
		k=$(($k-1))
		done
		fi
	done
}
function roll_dice()
{
	position=$1
	echo "Player is at: "$position
	echo "Dice  value: "$dice
	echo "Press (r or R) roll the dice."
	read input
	if [ "$input" = "r" -o "$input" = "R" ]
	then
 		dice=$(($RANDOM%6+1))
	return  $dice
	else
		echo "Enter the correct choice"
		roll_dice
	fi
}

function print()
{
	clear
	point=$1
	echo "========================="\"Snake ladder gmae"\"==========================="
	for ((i=9;i>=0;i--))
	do
	echo "----------------------------------------------------------------------"
		for((j=0;j<10;j++))
		do
		if [ $j -eq 0 ]
		then
			echo -e "|\c"
		fi
		if [ $i -eq 9 -a $j -eq 0 ]
		then
			echo -e "\c"
		else
			echo -e " \c"
		fi
		if [ "${arr[$i,$j]}" = "$point" ]
		then
			echo -e "[_]\c"
		elif [ "${arr[$i,$j]}" = "4" -o "${arr[$i,$j]}" = "12" -o "${arr[$i,$j]}" = "14" -o "${arr[$i,$j]}" = "22" -o "${arr[$i,$j]}" = "41" -o "${arr[$i,$j]}" = "54" ]
		then
			echo -e " # \c"
		elif [ "${arr[$i,$j]}" = "28" -o "${arr[$i,$j]}" = "37" -o "${arr[$i,$j]}" = "94" -o "${arr[$i,$j]}" = "96" -o "${arr[$i,$j]}" = "75" -o "${arr[$i,$j]}" = "47" ]
		then
			echo -e "&  \c"
		elif [ "${arr[$i,$j]}" = "56" -o "${arr[$i,$j]}" = "50" -o "${arr[$i,$j]}" = "58" -o "${arr[$i,$j]}" = "79" -o "${arr[$i,$j]}" = "88" ]
		then
			echo -e "@  \c"
		elif [ "${arr[$i,$j]}" = "71" -o "${arr[$i,$j]}" = "42" -o "${arr[$i,$j]}" = "32" -o "${arr[$i,$j]}" = "16" -o "${arr[$i,$j]}" = "5" -o "${arr[$i,$j]}" = "10" ]
		then
			echo -e "!! \c"
		else
			echo -e "${arr[$i,$j]} \c"
		fi
		if [ $i -gt 0 -a $j -lt 9 ]
		then
			echo -e " | \c"
		elif [ $i -eq 0 -a $j -eq 4 ]
		then
			echo -e " |\c"
		else
			echo -e "  | \c"
		fi
		done
		echo " "
	done
	echo "----------------------------------------------------------------------"
	echo "The ladder by #, Snake by &, incremnt by @ and decrement by !!."
}

function condition_position_check()
{
	up=$1
	dice=$2
	updated_position=$(echo "$up" "$dice"|awk '{print($1+$2)}')
	echo "Player is awk  at: "$updated_position
	pos=$updated_position
	case $updated_position in
		4) echo "Player got ladder"
			updated_position=56
				;;
		12) echo "Player got ladder"
			updated_position=50
				;;
		14) echo "Player got ladder"
			updated_position=55
				;;
		22) echo "Player got ladder"
			updated_position=58
				;;
		28) echo "Player got Snake"
			updated_position=10
				;;
		37) echo "Player got Snake"
			updated_position=3
				;;
		41) echo "Player got ladder"
			updated_position=79
				;;
		54) echo "Player got ladder"
			updated_position=88
				;;
		75) echo "Player got Snake"
			updated_position=32
				;;
		94) echo "Player got Snake"
			updated_position=71
				;;
		96) echo "Player got Snake"
			updated_position=42
				;;
		*) updated_position=0
				;;
		esac

		if [ "$updated_position" = "0" ]
		then
			return $pos
		else
			return $updated_position
		fi
}


function win_condition()
{
	local win=$1
	if [ $win -eq 100 ]
	then
		echo "Player Won"
		exit
	fi
	if [ $win -gt 100 ]
	then
		win=$(($win-$dice))
			return $win
	else
			return $win
	fi
}

assign
while true
do
print $wc
roll_dice $wc
roi=$?
echo "Dice value: "$roi
print $cpc
condition_position_check $wc $roi 
cpc=$?
win_condition $cpc
wc=$?
done
