+++
title = "Encryption"
lastmod = 2019-12-11T23:29:34+08:00
tags = ["curious"]
draft = true
author = "Qiangua"
+++

## Symmetric Cryptography {#symmetric-cryptography}

{{< highlight shell >}}
openssl aes-256- -a -e -in file-in.txt -inkey key.txt -out file-out.txt
openssl aes-256- -a -d -in file-in.txt -inkey key.txt -out file-out.txt
{{< /highlight >}}


## Asymmetric Cryptography {#asymmetric-cryptography}


### generate private key {#generate-private-key}

{{< highlight shell >}}
openssl genrsa -out private.pem 1024
{{< /highlight >}}


### generate public key from private key {#generate-public-key-from-private-key}

{{< highlight shell >}}
openssl rsa -in private.pem -pubout -out public.pem
{{< /highlight >}}


### encrypt file with public key {#encrypt-file-with-public-key}

{{< highlight shell >}}
openssl rsautl -encrypt -in test.org -inkey public.pem -pubin -out encrypted.inc
{{< /highlight >}}