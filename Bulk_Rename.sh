#!/bin/bash

if [ "$#" != 3 ] 
then
    echo "ERROR: 3 arguments required"
    exit 1
fi

username="PES2UG22CS409"
entered_username=$1
password="904SC22GU2SEP"
entered_password=$2
entered_directory_name=$3
count=0

rename_authentication() {
    if [ $username != $entered_username ]
    then 
        echo "Username is wrong. Going to exit the application."
        exit 254
    elif [ $password != $entered_password ] 
    then
        echo "Password is wrong. Going to exit the application."
        exit 255
    else 
        echo "Username and password are correct!"
        return 1
    fi
}

rename_authentication

for file in "$entered_directory_name"*.png
do 
    if [ -e "$file" ]
    then
        count=$((count+1))
    fi
done

echo "The number of matching files are $count"

for file in "$entered_directory_name"*.png
do
    if [ -e "$file" ]
    then
        renamed_file="${file%.*}.PNg"
        mv "$file" "$renamed_file"
        echo "Changed $file to $renamed_file"
    fi
done

if [ $? == 1 ] 
then
    exit 0
fi
