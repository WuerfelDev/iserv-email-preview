#!/bin/bash

# This code is under the MIT License (MIT)
# See LICENSE -file for whole license

iservhost=""
lact=""
lpwd=""



cookiefile="/tmp/iservcookie.txt"

curl --silent -d "login_act=$lact&login_pwd=$lpwd" -c "$cookiefile" "$iservhost" > /dev/null
alles=$(curl -b "$cookiefile" "${iservhost}msg/list.php?INBOX")
alles=${alles#*"</head>"}
alles=${alles%"<script"*}
suchenach=$(grep -c "'bold'" <<< "$alles")
a=0
output=""
for a in $(seq 1 $suchenach)
do
  alles=${alles#*"'bold' id='id"}
  #get email hash (idhash)
  idhash=${alles:0:8}
  # get email-ID
  alles=${alles#*"INBOX/"}
  id=${alles:0:8}
  id=${id%"'"*}
  # get Email subject
  alles=${alles#*"class='r2'>"}
  subject=${alles%%"</td></tr>"*}
  # remove html tags
  subject=$(echo "$subject" | sed 's/&[^>]*;//g' | sed 's/<[^>]*>//g')

  # store in arrays
  output="$output\n$subject\n${iservhost}msg/msg.php?INBOX/$id\n"

done


if [[ "$a" == "1" ]]
  then s=":"
elif [[ "$a" == "0" ]]
  then s="s."
else
  s="s:"
fi

#echo -e "You got $a new eMail$s\n$output" > output.txt
echo -e "You got $a new eMail$s\n$output"


rm $cookiefile > /dev/null
