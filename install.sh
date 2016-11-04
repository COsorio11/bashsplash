#!/bin/bash

for script in ./*.sh
do
  if [ ! $script == ./install.sh ]; then
    echo "Installing $script"
    # setting file equal to filename without extension. dot is there as it is removed in the cut but is necessary
    FILETMP=$(echo $script | cut -f 2 -d '.')
    FILE=$(echo $FILETMP | cut -f 2 -d '/')
    mv $script $FILE
    cp ./$FILE ~/.$FILE
    ln -s ~/.$FILE /usr/local/bin/$FILE
    echo "Install Successful"
  fi
done
