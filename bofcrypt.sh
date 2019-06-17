#!/bin/bash
PUBLICKEY=$1
INPUTFILE=$2
#generate session key that is used to encrypt the file
SESSIONKEY=`openssl rand -hex 32`
#encrypt the file using the generated session key
#encrypt the session key using the recipients public key

cat  << EOF
<?xml version="1.0" encoding="utf-8"?>
<ENCRYPTED_REPORT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <TITLE>BOFCRYPTNXT</TITLE>
  <VERSION>2.0</VERSION>
  <SESSION_KEY>`echo -n $SESSIONKEY | openssl rsautl -encrypt -inkey $PUBLICKEY -pubin -out >(base64)`</SESSION_KEY>
  <OUT_BUFFER>`openssl enc -aes-256-cbc -salt -pbkdf2 -a -pass pass:$SESSIONKEY -in $INPUTFILE`</OUT_BUFFER>
</ENCRYPTED_REPORT>
EOF
