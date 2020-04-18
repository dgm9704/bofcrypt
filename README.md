# bofcrypt

An attempt to create a reference implementation for encrypting report files for sending to Finanssivalvonta (FIN-FSA)

**AT THE MOMENT THIS DOES NOT PRODUCE A CORRECT RESULT**

- The file is in correct format and everything looks OK on the surface
- The session key seems to be correctly generated and encrypted
- There is some problem that prevents the actual file content from being decrypted, 
  most likely something wrong with salting or the initialization vector



Uses [openssl](https://www.openssl.org/) for encryption

The public key was extracted from fin-fsa website


All comments, suggestions, bugs etc are welcome!
