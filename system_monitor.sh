#!/bin/bash
#系统信息监控脚本
echo -e "\033[1;35mSystem running status: \033[0m"

#check OS type
	echo -e "\033[32mOS type : $(uname -o)\033[0m"
#check OS Release Version
	echo -e "\033[32mOS Release Version : $(cat /etc/issue | cut -d " " -f 1,2,3 | grep "[a-Z0-9]")\033[0m"
#check OS Architecture
	echo -e "\033[32mOS Architectur : $(uname -i)\033[0m"
#check Kernel Release
	echo -e "\033[32mKernel Release : $(uname -r)\033[0m"
#check hostname
	echo -e "\033[32mhostname : $(hostname)\033[0m"
#check ip address
	echo -e "\033[32mThe host ip address : $(hostname -I | cut -d " " -f 1 )\033[0m "
	echo -e "\033[32mThe default gateway : $(hostname -I | cut -d " " -f 2 )\033[0m "
#check Network status
	tt_net=$(ping www.baidu.com -c 1 &> /etc/null && echo yes || echo no)
	case $tt_net in
		"no")
			echo -e "\033[31mNetwork is not connected!\033[0m"
		;;
		"yes")
			echo -e "\033[32mNetwork is connected!\033[0m"
			time_net=$(ping www.baidu.com -c 1 | grep ttl | cut -d " " -f 7 | cut -d "=" -f 2 | cut -d "." -f 1)
			if [ $time_net -le 3 ]
				then
					echo -e  "\033[32mThe network status is good!\033[0m"
			else
				echo -e "\033[31mThe network  status is bad!\033[0m"
			fi
		;;
		*)
			echo -e "\033[31mNetwork status unknow!\033[0m"
		;;
	esac
#check DNS
	echo -e "\033[32mThe default DNS ip address : $(cat /etc/resolv.conf | grep nameserver | sed -n '1p' | cut -d " " -f 2 )\033[0m"
#check logged in users
	echo -e "\033[32mThe logged in users :\033[0m"
	echo -e "\033[36m$(who)\033[0m"
