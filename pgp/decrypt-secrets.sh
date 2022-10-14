#!/bin/bash

export GPG_TTY=$(tty)
export AWS_PROFILE=laszlobekessy-terraform

echo "=== Getting terraform output for IAM users"
terraform output -json iam_access_keys > pgp/secret-keys-encrypted.json

echo "=== Parsing the Output JSon"
echo "====== For the encryption PASSPHRASE check the key-gen-template"

jq -c '.[]' pgp/secret-keys-encrypted.json | while read i; do
    name=$(jq -r '.name' <<< "$i");
    key=$(jq -r '.key' <<< "$i");
    secret=$(jq -r '.secret' <<< "$i")
    decoded=$(echo $secret | base64 --decode | gpg --decrypt)
    echo " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo " - $name | key: $key | secret: $decoded"
    echo " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done
