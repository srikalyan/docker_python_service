#!/bin/bash

# NOTE: APP_NAME env variable must be defined in the child docker image to work properly

export SERVICE_PORT=${SERVICE_PORT:-80}
export NUM_PROCESSES=${NUM_PROCESSES:-4}
export NUM_THREAD_PER_PROCESS=${NUM_THREAD_PER_PROCESS:-2}

if [ -z "$@" ] ; then

  if [[ -z "${APP_NAME}" ]] ; then
    echo "You must provide the APP_NAME env variable"
    exit 255
  fi

  echo "Running UWSGI app '${APP_NAME}' on '${SERVICE_PORT}', # processes '${NUM_PROCESSES}', # threads '${NUM_THREAD_PER_PROCESS}'"

  uwsgi \
  --http :${SERVICE_PORT} \
  --master \
  --lazy \
  --processes ${NUM_PROCESSES} \
  --threads ${NUM_THREAD_PER_PROCESS} \
  -w ${APP_NAME}.wsgi:app

else
  echo "Running $@"
  exec "$@"
fi
