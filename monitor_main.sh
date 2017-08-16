#!/bin/bash
#主控脚本
echo -e "\033[1;31mWelcome to the main monitor shell,please read the content following! \033[0m"
echo -e "\033[1;35mNow we provide $(ls . | grep -v main | grep -v RE | wc -l) scripts: \n$(ls . | grep -v main | grep -v RE) \033[0m"
