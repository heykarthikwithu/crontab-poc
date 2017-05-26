#!/bin/bash

usage()
{
cat << EOF

usage $0 options

OPTIONS
  -p path to files to be deleted
  -d number of days older files

EOF
}

path=''
numberofdays=''

if [ $# -eq 0 ];
then
  usage
  exit 1
fi

while getopts "hp:d:" opt
do
  case $opt in
  h)
    usage
    exit 1
    ;;
  p)
    echo "Path : $OPTARG"
    path=$OPTARG
    ;;
  d)
    echo "Number of days : $OPTARG"
    numberofdays=$OPTARG
    ;;
  \?)
    echo "Invalid option: $OPTARG" >&2
    usage
    exit 1
    ;;
  :)
    echo "Option -$OPTARG requires an argument." >&2
    usage
    exit 1
    ;;
  esac
done

if [ ! -z $path ] && [ ! -z $numberofdays ];
then
  find ${path}/* -mtime +${numberofdays} -exec rm {} \;
  echo "Cleaned the files..!"
  exit 1
fi
