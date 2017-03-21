# JWT (Json Web Token) one of all tokens 

## token string format

A.B.C

## token contain 
> A. header 
==Base64(`{"typ":"JWT","alg":"HS512"}`)  

> B. payload
==Base64(`{"sub":"9876655444321","exp":"47464344"}`) 

> C. signature   
== fooAlg('A.B',secret)  
secret key:"setup your private key"
`utyJhnzUhcqnTdswjgaK7QMa9qTaU9WXyY2BHsU9tFFz5MBz1kbj5vro39uXBluLgf8oEEBN2lXk/5moP4z3XQ==`

token example:
>eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9`.`eyJzdWIiOiI5ODc2NjU1NDQ0MzIxIiwiZXhwIjoiNDc0NjQzNDQifQ`.`utyJhnzUhcqnTdswjgaK7QMa9qTaU9WXyY2BHsU9tFFz5MBz1kbj5vro39uXBluLgf8oEEBN2lXk/5moP4z3XQ==

[useful url](https://1024tools.com/hmac)
## token practice    
Client---------------Server

(App/Browser)---------------(Java/Ruby/python ...)   

store token---------------Generate Token 

### transfer token  
1. Http header {Ajax[headers:Authorization]}
2. URL  parameter
3. Http post form

### verify token    



