# openssl
> OpenSSL is a cryptography toolkit implementing the Secure Sockets Layer (SSL v2/v3) and Transport Layer Security (TLS v1) network protocols and related cryptography standards required by them.

## Encryption and Decryption with Ciphers
### encryption
```bash
dd if=/to/be/encrypted/file/path/xxx.txt |openssl des3 -salt -k xxx |dd of=/encrypted/file/path/xxx.txt.en
```

### decryption
```bash
dd if=/encrypted/file/path/xxx.txt.en |openssl des3 -d -k xxx |dd of=/to/be/encrypted/file/path/xxx.txt
```