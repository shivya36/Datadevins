#!/bin/bash

fa="$1"

if [ -z "$fa" ]
then
    :
elif [ "$fa" == "help" ]
then
    echo "help for $0"
    exit 0
elif [ "$fa" == "suid_audit" ]
then
     for val in `echo $PATH | tr ':' '\n'`;
     do
        sudo find "$val" -perm /4000  > ~/tmp/suid_audit.txt
     done
     exit 0
else
    :
fi

d1="$HOME/data"
d2="$HOME/tmp"

function checksudo()
{
   if groups | grep "\<sudo\>" &> /dev/null; then
           echo "User has sudo rights"
   else
           echo "User has no sudo rights"
           exit 1
   fi
}

function homedir()
{
  if [ -d "$d1" ]
  then
      echo "Directory data already exists"
  else
      mkdir $d1
      echo "Directory data created"
  fi

  if [ -d "$d2" ]
  then
      echo "Directory tmp already exists"
  else
      mkdir $d2
      echo "Directory tmp created"
  fi
}

homedir

function installpack()
{
   checksudo

   echo "Enter the package file name"
   read filename
   if [ -f "$HOME/data/$filename" ]
   then
       bp="$HOME/data/$filename"
   else
       echo "No such file exists please create one"
       exit 1
   fi

   for val in `cat $bp`;
   do
     sudo apt-get install $val
   done

   echo "-------FINAL STATUS OF PACKAGES------"

   for val in `cat $bp`;
   do
     if ! dpkg -l "$val" &> /dev/null ; then
         echo "$val PACKAGE IS NOT INSTALLED"
     else
         echo "$val PACKAGE IS INSTALLED"
     fi
   done
}

installpack

function addingusers()
{
   checksudo

   echo "Enter the users file name"
   read filename

   if [ -f "$HOME/data/$filename" ]
   then
       up="$HOME/data/$filename"
   else
       echo "No such file exists please create one"
       exit 1
   fi

   for val in `cat $up`;
   do
      if getent passwd $val > /dev/null; then
         echo "User $val already exists"
      else
         sudo adduser $val
      fi
   done

   echo "------FINAL USER STATUS-----"

   for val in `cat $up`;
   do
      if getent passwd $val > /dev/null; then
         echo "User $val exists"
      else
         echo "User $val does not exist"
      fi
   done
}

addingusers
