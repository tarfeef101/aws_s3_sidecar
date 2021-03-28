#!/bin/sh
OLDIFS=$IFS
IFS='|'
for each in $FILES; do
  aws s3 cp s3://$BUCKET/$each /opt/$each
  if [ $FLAG -eq 1 ]; then
    mv /opt/$each /opt/$(basename $each)
  fi
done
IFS=$OLDIFS
tail -f /dev/null
