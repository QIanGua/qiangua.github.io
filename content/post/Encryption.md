+++
title = "Encryption"
date = 2019-12-16T00:34:00+08:00
lastmod = 2019-12-16T00:35:39+08:00
tags = ["curious"]
draft = false
author = "Qiangua"
+++

-   State "DONE"       from "TODO"       <span class="timestamp-wrapper"><span class="timestamp">[2019-12-16 Mon 00:34]</span></span>


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


### decrypt file wiht private key {#decrypt-file-wiht-private-key}

{{< highlight shell >}}
openssl rsatul -decrypt -in encrypted.inc -inkey private.pem -out decrypted.org
{{< /highlight >}}


## GNUGPG {#gnugpg}

GNUGPG is a practical terminal tool for encryption. Here are two typical commands

{{< highlight shell >}}
gpg --encrypt -r ID test.txt
gpg --decrypt test.txt.gpg --out-put test.de.txt
{{< /highlight >}}