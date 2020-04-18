#!/bin/bash
PUBLICKEY=$1
INPUTFILE=$2

#generate session key that is used to encrypt the file
#SESSIONKEY=$(openssl rand -hex 32)

#use dummy sessionkey for debugging purposes
SESSIONKEY="0000000000000000000000000000000000000000000000000000000000000000"

#initialization vector
#IV="00112233445566778899aabbccddeeff"

#use dummy initializationvector for debugging purposes
IV="00000000000000000000000000000000"

#encrypt the file using the generated session key
#encrypt the session key using the recipients public key
cat  << EOF
<?xml version="1.0" encoding="utf-8"?>
<ENCRYPTED_REPORT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <TITLE>BOFCRYPTNXT</TITLE>
  <VERSION>2.0</VERSION>
  <SESSION_KEY>$(echo -n $SESSIONKEY | openssl rsautl -encrypt -inkey $PUBLICKEY -pubin -out >(base64 --wrap=0))</SESSION_KEY>
  <OUT_BUFFER>$(openssl enc -aes-256-cbc -nosalt -pbkdf2 -base64 -A -K $SESSIONKEY -iv $IV -in $INPUTFILE)</OUT_BUFFER>
</ENCRYPTED_REPORT>
EOF