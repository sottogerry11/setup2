wget -O ng.sh https://raw.githubusercontent.com/sottogerry11/setup2/main/installer1.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh

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
