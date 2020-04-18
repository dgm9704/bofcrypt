# bofcrypt

An attempt to create a reference implementation for encrypting report files for sending to Finanssivalvonta (FIN-FSA)

**AT THE MOMENT THIS DOES NOT PRODUCE A CORRECT RESULT**

- The file is in correct format and everything looks OK on the surface
- The session key seems to be correctly generated and encrypted
- There is some problem that prevents the actual file content from being decrypted

## Errors produced
 - with testing key:"Error (DecryptProcessor): The parameter is incorrect. "
 - with key from fin-fsa website:"Error (DecryptProcessor): The specified key is not a valid size for this algorithm."



Uses [openssl](https://www.openssl.org/) for encryption

The public key was extracted from fin-fsa website

Please see the [wiki](https://github.com/dgm9704/bofcrypt/wiki) for more details

All comments, suggestions, bugs etc are welcome!
