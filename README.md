# see also
[my dotnet library for doing the encryption](https://github.com/dgm9704/shroud)

[my dotnet library for handling XBRL reports](https://github.com/dgm9704/Xoxo)

[my dotnet library for handling AIFMD reports](https://github.com/dgm9704/fame)

[my dotnet library for handling FIN-FSA headers](https://github.com/dgm9704/tldr)

# bofcrypt.sh

A sample implementation for encrypting report files for sending to Finanssivalvonta (FIN-FSA)

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
