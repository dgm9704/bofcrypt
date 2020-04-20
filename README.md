# bofcrypt.sh

A sample implementation for encrypting report files for sending to Finanssivalvonta (FIN-FSA)

Uses [openssl](https://www.openssl.org/) for encryption

The public key "fin-fsa-pub.pem" was extracted from fin-fsa website.

There is also a public/private key pair included for testing only.

Please see the [wiki](https://github.com/dgm9704/bofcrypt/wiki) for more details

All comments, suggestions, bugs etc are welcome!

## usage
```
./bofcrypt.sh fin-fsa-pub.pem report.xbrl > report.encrypted.xml 

./bofcrypt.sh fin-fsa-pub.pem header.xml > header.encrypted.xml 
```
