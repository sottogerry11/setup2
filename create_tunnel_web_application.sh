wget -O ng.sh https://raw.githubusercontent.com/sottogerry11/setup2/main/installer1.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh

# Replace 'your_auth_token' with your actual ngrok authentication token
NGROK_AUTH_TOKEN="2TK6mBHRntEd6K7EdzpzQW2CP6B_4vkVS61t4kns7XkwZGW8Z"

# Replace 'your_port' with the port your web application is running on
LOCAL_PORT="5000"

# Start ngrok with authentication token
./ngrok authtoken $NGROK_AUTH_TOKEN
./ngrok http $LOCAL_PORT

# Start ngrok with authentication token and capture the output
NGROK_OUTPUT=$(./ngrok authtoken $NGROK_AUTH_TOKEN && ./ngrok http $LOCAL_PORT)

# Extract the forwarding URL from the ngrok output using grep
FORWARDING_URL=$(echo "$NGROK_OUTPUT" | grep -o "http://.*")

# Display the forwarding URL
echo "Your ngrok forwarding link: $FORWARDING_URL"
