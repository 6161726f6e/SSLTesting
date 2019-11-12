#!/bin/bash
# reads in IP/hosts from addresses.txt.  Pulls the Subject field
# from the certificate and writes to a file.  Useful for verifiying
# hosts in Pen Test belong to the Org in scope
touch verifyCerts.txt
while read a; do
        echo $a >> verifyCerts.txt
        timeout 10 openssl s_client -connect $a:443 < /dev/null | grep -i subject >> verifyCerts.txt
        echo "-----------------" >> verifyCerts.txt
done <addresses.txt
