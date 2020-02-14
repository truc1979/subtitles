#!/bin/bash

function usage()
{
  echo "USAGE: $(basename $0) fich1.srt [fich2.srt ...] -t 00:23:56"
}

while [ $# -gt 1 ] ; do
  case "${1}" in
    "-t")
        shift
        ts="$1"
        shift
        ;;
    *)
        fichiers="${fichiers} $1"
        shift
        ;;
  esac
done

if [ "z$ts" = "z" -o "z$fichiers" = "z" ] ; then
  usage
  exit 1
fi


echo "Recherche dans ces fichiers:"
for f in $fichiers ; do
  echo $f
done
echo


for f in $fichiers ; do

  echo
  echo
  echo === $f
  echo

  grep --color -A1 -B1 -E "^$ts" $f

done


