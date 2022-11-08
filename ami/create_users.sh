#!/usr/bin/env bash

set -eu
while read -r email
do
    email=$(echo "$email" | awk '{print tolower($0)}')
    echo "Adding $email"
    aws iam create-user --user-name "$email"
    aws iam add-user-to-group --group-name student --user-name "$email"
    aws iam create-login-profile --user-name "$email" --password TTTttt1234
done
