#!/bin/sh
NO_SIGN_FLAG=""
if [ "$NO_SIGN_REQUEST" = "1" ]; then
  NO_SIGN_FLAG="--no-sign-request"
fi
OLDIFS=$IFS
IFS='|'
for each in $FILES; do
  aws s3 cp $NO_SIGN_FLAG s3://$BUCKET/$each /opt/$each
  if [ $BASENAME -eq 1 ]; then
    mv /opt/$each /opt/$(basename $each)
  fi
done
IFS=$OLDIFS
tail -f /dev/null
