# bofcrypt.sh

An attempt to create a reference implementation for encrypting report files for sending to Finanssivalvonta (FIN-FSA)

Uses [openssl](https://www.openssl.org/) for encryption

The public key "fin-fsa-pub.pem" was extracted from fin-fsa website.

There is also a public/private key pair included for testing only.

Please see the [wiki](https://github.com/dgm9704/bofcrypt/wiki) for more details

All comments, suggestions, bugs etc are welcome!

## usage
```
zip report.zip report.xbrl 

./bofcrypt.sh fin-fsa-pub.pem report.zip > report.encrypted.xml 

./bofcrypt.sh fin-fsa-pub.pem header.xml > header.encrypted.xml 

zip reportpackage.zip header.encrypted.xml report.encrypted.xml
```