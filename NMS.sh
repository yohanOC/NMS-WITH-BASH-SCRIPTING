#!/bin/bash

#function send message to telegram or other
func_send_message() {

	chat_id="xxxxxxxx" #your chatid
	url="https://api.telegram.org/xxxxxxxxxx/sendMessage" #xxxxxxxx your bot id
	message="$1 Down Please Check"
	curl -s -X POST "$url" -d chat_id="$chat_id" -d text="$message"
	 
}

while IFS= read -r ip; do #open file and store to variable ip

    if ping -q -c2 "$ip" &>/dev/null; then #confition 
        echo "$ip is Pingable" #result if devices up
    else
     	func_send_message $ip #result if devices down
    fi

done </home/ip.txt #path file list ip devices
