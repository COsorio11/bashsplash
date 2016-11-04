# !/bin/bash
BASHRC=~/.bashrc
BASH_PROFILE=~/.bash_profile

if head -n 1 $1 | grep \#!
then
  if [ -L $BASHRC ]; then
    printf "Appending to .bashrc\n"
    if cat ~/.bashrc | grep -i $1
    then
      printf "This script is already applied to your .bashrc\n"
    else
      echo "source $1" >> ~/.bashrc
      echo "please reload to terminal to see your new screen"
    fi
  elif [ -L $BASH_PROFILE ]; then
    printf "Appending to .bash_profile\n"
    if cat ~/.bash_profile | grep -i $1
    then
      printf "This script is already applied to your .bash_profile\n"
    else
      echo "source $1" >> ~/.bash_profile
      echo "please reload to terminal to see your new screen"
    fi
  else
    echo "You do not have a .bashrc or .bash_profile in your home directory."
  fi
else
  echo "This is not the script you are looking for. It is not like the others, you seem to be missing a shebang."
fi
