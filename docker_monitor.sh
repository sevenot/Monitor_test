#!/bin/bash
#docker status monitor script
	echo -e "\033[1;31mDocker containers status:\033[0m"

#total containers
	total=$(( $(docker ps -a | wc -l) -1 ))
	echo -e "\033[32mTotal containers : \033[34m$total\033[0m"
#containers with port to localhost
	por=$(netstat -tunpla | grep docker | wc -l)
	echo -e "\033[32mPort to localhost containers : \033[34m$por\033[0m"
#running containers
	run=$(( $(docker ps | wc -l) -1))
	echo -e "\033[32mRunning containers : \033[34m$run\033[0m"

#Exited containers
	exi=$(docker ps -a | grep Exited | wc -l)
	echo -e "\033[31mExited containers : $exi\033[0m"
	docker ps -a | grep Exited
