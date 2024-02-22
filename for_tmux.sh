function goto {
    label=$1
    cd 
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | 
          grep -v ':$')
    eval "$cmd"
    exit
}

: ngrok
clear
echo "Go to: https://dashboard.ngrok.com/get-started/your-authtoken"
CRP="2TK6mBHRntEd6K7EdzpzQW2CP6B_4vkVS61t4kns7XkwZGW8Z"
./ngrok authtoken $CRP 

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
CRP="au"
./ngrok tcp --region $CRP 4000 &>/dev/null &
sleep 1
if curl --silent --show-error http://127.0.0.1:4040/api/tunnels  > /dev/null 2>&1; then 
  echo "OK"
else
  echo "Ngrok Error! Please try again!"
  sleep 1
  goto ngrok
fi

docker run --rm -d --network host --privileged --name nomachine-mate -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=1g thuonghai2711/nomachine-ubuntu-desktop:mate

clear
echo "NoMachine: https://www.nomachine.com/download"
echo "Done! NoMachine Information:"
echo "IP Address:"
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p' 
echo "User: user"
echo "Passwd: 123456"
echo "VM can't connect? Restart Cloud Shell then Re-run script."

# Countdown loop for 20 hours (72,000 seconds)
seq 1 72000 | while read i; do
  echo -en "\r Running .     $i s / 72000 s"
  sleep 0.1
  echo -en "\r Running ..    $i s / 72000 s"
  sleep 0.1
  echo -en "\r Running ...   $i s / 72000 s"
  sleep 0.1
  echo -en "\r Running ....  $i s / 72000 s"
  sleep 0.1
  echo -en "\r Running ..... $i s / 72000 s"
  sleep 0.1
  echo -en "\r Running     . $i s / 72000 s"
  sleep 0.1
  echo -en "\r Running  .... $i s / 72000 s"
  sleep 0.1
  echo -en "\r Running   ... $i s / 72000 s"
  sleep 0.1
  echo -en "\r Running    .. $i s / 72000 s"
  sleep 0.1
  echo -en "\r Running     . $i s / 72000 s"
  sleep 0.1
done

# Rest of the script

# Additional commands or actions after the countdown loop

# ... (For example, you can run some cleanup code or additional tasks here) ...

# End of the script
echo "Script execution completed."