#!/bin/bash
#系统信息监控脚本
echo -e "\033[1;35mSystem running status: \033[0m"

#check OS type
	echo -e "\033[32mOS type : \033[34m$(uname -o)\033[0m"
#check OS Release Version
	echo -e "\033[32mOS Release Version : \033[34m$(cat /etc/issue | cut -d " " -f 1,2,3 | grep "[a-Z0-9]")\033[0m"
#check OS Architecture
	echo -e "\033[32mOS Architectur :\033[34m $(uname -i)\033[0m"
#check Kernel Release
	echo -e "\033[32mKernel Release :\033[34m $(uname -r)\033[0m"
#check hostname
	echo -e "\033[32mhostname :\033[34m $(hostname)\033[0m"
#check ip address
	echo -e "\033[32mThe host ip address :\033[34m $(hostname -I | cut -d " " -f 1 )\033[0m "
	echo -e "\033[32mThe default gateway :\033[34m $(hostname -I | cut -d " " -f 2 )\033[0m "
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
	echo -e "\033[32mThe default DNS ip address :\033[34m $(cat /etc/resolv.conf | grep nameserver | sed -n '1p' | cut -d " " -f 2 )\033[0m"
#check logged in users
	echo -e "\033[32mThe logged in users :\033[0m"
	echo -e "\033[34m$(who)\033[0m"
#check system memory
	echo -e "\033[32mThe total memory : \033[34m$(free -h | grep Mem | awk '{print $2}')\033[0m"
	echo -e "\033[32mThe total memory : \033[34m$(free -h | grep Mem | awk '{print $3}')\033[0m"
#check CPU status
	echo -e "\033[32mThe free CPU percent : \033[34m$(top -n 1 | grep Cpu | awk '{printf $8}')%\033[0m"
#check Hard Disk status
	echo -e "\033[32mThe Hard Disk status:\033[0m"
	echo -e "\033[34m$(df -h | grep Filesystem)\033[0m"
	echo -e "\033[34m$(df -h | grep "^/dev/")\033[0m"
