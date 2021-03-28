#!/bin/sh
OLDIFS=$IFS
IFS='|'
for each in $FILES; do
  aws s3 cp s3://$BUCKET/$each /opt/$each
done
IFS=$OLDIFS
tail -f /dev/null
