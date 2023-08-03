#!/bin/bash

wget -O ng.sh https://github.com/sottogerry11/setup2/raw/main/installer1.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh

function goto
{
    label=$1
    cd 
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | 
          grep -v ':$')
    eval "$cmd"
    exit
}

# Prompt for ngrok authentication token
: ngrok
clear
echo "Go to: https://dashboard.ngrok.com/get-started/your-authtoken"
read -p "Paste Ngrok Authtoken: " CRP
./ngrok authtoken $CRP 

# Prompt for ngrok region
clear
echo "Repo: https://github.com/sottogerry11/setup2"
echo "======================="
echo "choose ngrok region (for better connection)."
echo "======================="
echo "us - United States (Ohio)"
echo "eu - Europe (Frankfurt)"
echo "ap - Asia/Pacific (Singapore)"
echo "au - Australia (Sydney)"
echo "sa - South America (Sao Paulo)"
echo "jp - Japan (Tokyo)"
echo "in - India (Mumbai)"
read -p "choose ngrok region: " CRP
./ngrok tcp --region $CRP 4000 &>/dev/null &
sleep 1
if curl --silent --show-error http://127.0.0.1:4040/api/tunnels  > /dev/null 2>&1; then
    echo "OK"
else
    echo "Ngrok Error! Please try again!"
    sleep 1
    goto ngrok
fi

# Run Docker container with NoMachine
docker run --rm -d --network host --privileged --name nomachine-mate -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=1g thuonghai2711/nomachine-ubuntu-desktop:mate
clear
echo "NoMachine: https://www.nomachine.com/download"
echo "Done! NoMachine Information:"
echo "IP Address:"
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p' 
echo "User: user"
echo "Passwd: 123456"
echo "VM can't connect? Restart Cloud Shell then Re-run script."

# 24-hour countdown
seq 1 86400 | while read i; do
    echo -en "\r Running .     $i s / 86400 s"
    sleep 0.1
    echo -en "\r Running ..    $i s / 86400 s"
    sleep 0.1
    echo -en "\r Running ...   $i s / 86400 s"
    sleep 0.1
    echo -en "\r Running ....  $i s / 86400 s"
    sleep 0.1
    echo -en "\r Running ..... $i s / 86400 s"
    sleep 0.1
    echo -en "\r Running     . $i s / 86400 s"
    sleep 0.1
    echo -en "\r Running  .... $i s / 86400 s"
    sleep 0.1
    echo -en "\r Running   ... $i s / 86400 s"
    sleep 0.1
    echo -en "\r Running    .. $i s / 86400 s"
    sleep 0.1
    echo -en "\r Running     . $i s / 86400 s"
    sleep 0.1
done

echo "24 hours completed!"
exit 0
