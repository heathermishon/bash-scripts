#!/bin/sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
}

# Get full path to executing dir
SOURCE="${BASH_SOURCE[0]}"
DIR="$( dirname "$SOURCE" )"
while [ -h "$SOURCE" ]
do 
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd )"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

echo "Thanks for installing profile scripts\n"

# Backup existing file
echo "Backing up current files\n"
today=`date +%Y%m%d`
for i in $HOME/.bash_profile $HOME/.bashrc
do 
  if [ -e $i ] && [ ! -L $i ] 
    then 
      echo 'Backing up $i\n'
      mv $i $i.$today
  fi
done

# Set up simlinks
echo "Setting up simlinks\n"
lnif $DIR/.bash_profile $HOME/.bash_profile
lnif $DIR/.bashrc $HOME/.bashrc

echo "Done!"
