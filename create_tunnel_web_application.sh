wget -O ng.sh https://raw.githubusercontent.com/sottogerry11/setup2/main/installer1.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh

# Replace 'your_auth_token' with your actual ngrok authentication token
NGROK_AUTH_TOKEN="2TK6mBHRntEd6K7EdzpzQW2CP6B_4vkVS61t4kns7XkwZGW8Z"

# Replace 'your_port' with the port your web application is running on
LOCAL_PORT="your_port"

# Start ngrok with authentication token
./ngrok authtoken $NGROK_AUTH_TOKEN
./ngrok http $LOCAL_PORT
