#!/bin/bash
if [ -d "./docker" ]
then
     if [ -d "./docker/db" ]
     then
                 :
     else
                echo "------Creating db directory------"
                mkdir ./docker/db
     fi

     if [ -d "./docker/www" ]
     then
                 :
     else
                 echo "-------Creating www directory--------"
                 mkdir ./docker/www
                 echo "-------Copying index.php---------"
                 cp ./index.php ./docker/www/
     fi
else
            echo "-------Creating docker directory--------"
            mkdir ./docker
            echo "------Creating db directory------"
            mkdir ./docker/db
            echo "------Creating www directory-------"
            mkdir ./docker/www
            echo "-----Copying index.php-------"
            cp ./index.php ./docker/www/
            cp ./Dockerfile ./docker
fi

if dpkg -l "docker" &> /dev/null; then
            :
else
             echo "-------Setting up docker-------"
             sudo apt install docker
             sudo usermod -aG docker $USER
fi

if dpkg -l "docker-compose" &> /dev/null; then
             :
else
            echo "--------Setting up docker-compose--------"
            sudo apt install docker-compose
fi
