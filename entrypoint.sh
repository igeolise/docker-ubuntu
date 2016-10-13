#!/bin/bash
set -euo pipefail

# Add local user if LOCAL_USER_ID env variable is passed
if [ -n "${LOCAL_USER_ID-}" ]; then
  echo "Starting with UID : ${LOCAL_USER_ID}"
  #ignore "user already exists" error
  useradd --shell /bin/bash -u ${LOCAL_USER_ID} -m user || true
  export HOME=/home/user

  chown -R user:user /home/user

  exec gosu user "$@"
else
  exec "$@"
fi
