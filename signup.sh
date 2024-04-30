# Create a SignUp Form in Shell Script and check the password match or not

#!/bin/bash
read -p "Enter your name : " name 
read -p "Enter your email : " email
echo -n "Enter your password :"
read  -s password 
echo -n "ReEnter your password : " 
read -s repassword


if [[ $password == $repassword ]]
then
    echo -e "\n"
    echo "Account created successfully"
    echo -e "\n"
     printf "WELCOME $name\n"
     printf "your name is $name\n"
     printf "your email is $email\n"
    
    
    else 
    echo "Password does not match try again"
fi
