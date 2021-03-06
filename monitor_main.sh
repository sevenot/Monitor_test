#!/bin/bash
#The main script
while true
do

echo -e "\033[1;31mWelcome to the main monitor shell,please read the content following! \033[0m"
num_scripts=$(ls . | grep .sh | grep -v main | wc -l)
echo -e "\033[1;31mNow we provide $num_scripts scripts: \033[0m"

declare -i num=1
declare -a Arr
for i in $(ls . | grep .sh | grep -v main)
	do
		echo -e "\033[32m$num ==> $i : \033[34m$(sed -n '2p' $i | cut -d "#" -f 2)\033[0m"
		Arr[$num]=$i
		num=$(($num+1))
	done

	
	read -p "Please input the number of script that you want to exec( 1 - $num_scripts;q to quit) : " cho
	if [ $cho == "q" ]
		then
			exit 0
	fi


	for((i=1;i<=$num_scripts;i=i+1))
		do
			if [ $cho == $i ]
				then
					./${Arr[$i]}
			fi
		done
	echo "###################################################################################"
	echo "#                                                                                 #"
	echo "###################################################################################"
done
