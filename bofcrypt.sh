#!/bin/bash
openssl rand -out sessionkey -hex 64
openssl enc -aes-256-cbc -a -pass file:./sessionkey -in "$1" -out "$1.enc"
openssl rsautl -encrypt -inkey "$2" -pubin -in ./sessionkey -out >(base64 > sessionkey.enc)
