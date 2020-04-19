# 
# Copyright 2020 John Nordberg (john.nordberg@gmail.com)
#  
# Licensed under the EUPL, Version 1.2 or – as soon they
# will be approved by the European Commission - subsequent 
# versions of the EUPL (the "Licence");
# You may not use this work except in compliance with the Licence.
# You may obtain a copy of the Licence at:
#  
# https://joinup.ec.europa.eu/software/page/eupl
#  
# Unless required by applicable law or agreed to in 
# writing, software distributed under the Licence is
# distributed on an "AS IS" basis,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied.
# See the Licence for the specific language governing
# permissions and limitations under the Licence.
#

#!/bin/bash
PUBLICKEY=$1
INPUTFILE=$2


#generate session key that is used to encrypt the file
#256 bits = 32 bytes = 64 characters in hex
#SESSIONKEY=$(openssl rand -hex 32)
#use dummy sessionkey for debugging purposes
SESSIONKEY="0000000000000000000000000000000000000000000000000000000000000000"

#initialization vector 16 bytes = 32 characters in hex
#SESSIONKEY=$(openssl rand -hex 16)
#use dummy initializationvector for debugging purposes
IV="00000000000000000000000000000000"

#encrypt the file using the generated session key
#key and iv need to be in hex format 
#also add the raw initialization vector in front
#  use -nosalt for debugging purposes
echo $IV | xxd -r -p > OUT_BUFFER_RAW
openssl enc -aes-256-cbc -nosalt -K $SESSIONKEY -iv $IV -in $INPUTFILE >> OUT_BUFFER_RAW
base64 --wrap=0 OUT_BUFFER_RAW > OUT_BUFFER

#encrypt the raw session key using the recipients public key
echo $SESSIONKEY | xxd -r -p | openssl rsautl -encrypt -inkey $PUBLICKEY -pubin > SESSION_KEY_RAW
base64 --wrap=0 SESSION_KEY_RAW > SESSION_KEY



#output to xml with binary values base64 encoded
cat  << EOF
<?xml version="1.0" encoding="utf-8"?>
<ENCRYPTED_REPORT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <TITLE>BOFCRYPTNXT</TITLE>
  <VERSION>2.0</VERSION>
  <SESSION_KEY>$(<SESSION_KEY)</SESSION_KEY>
  <OUT_BUFFER>$(<OUT_BUFFER)</OUT_BUFFER>
</ENCRYPTED_REPORT>
EOF