#!/bin/bash
#generate session key that is used to encrypt the file
openssl rand -out sessionkey -hex 64
#encrypt the file using the generated session key
openssl enc -aes-256-cbc -a -pass file:./sessionkey -in "$1" -out "$1.enc"
#encrypt the session key using the recipients public key
openssl rsautl -encrypt -inkey "$2" -pubin -in ./sessionkey -out >(base64 > sessionkey.enc)

cat  << EOF
<?xml version="1.0" encoding="utf-8"?>
<ENCRYPTED_REPORT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <TITLE>BOFCRYPTNXT</TITLE>
  <VERSION>2.0</VERSION>
  <SESSION_KEY>$(<sessionkey.enc)</SESSION_KEY>
  <OUT_BUFFER>$(<"$1.enc")</OUT_BUFFER>
</ENCRYPTED_REPORT>
EOF
