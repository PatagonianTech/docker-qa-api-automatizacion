#!/usr/bin/env bash

export REPDIR='./reporte'
rep_opt="overwrite=false,reportDir=${REPDIR}"

if [ ! -z "$REPNAME" ]; then
  [ ! -z "$rep_opt" ] && rep_opt="${rep_opt},"
  rep_opt="${rep_opt}reportFilename=${REPNAME// /\\ }"
fi

if [ ! -z "$REPTITLE" ]; then
  [ ! -z "$rep_opt" ] && rep_opt="${rep_opt},"
  rep_opt="${rep_opt}reportTitle=${REPTITLE// /\\ },reportPageTitle=${REPTITLE// /\\ }"
fi

set -x
/app/node_modules/mocha/bin/mocha --reporter mochawesome --reporter-options "$rep_opt" "$@"
chown -R ${HOST_USER}:${HOST_GROUP} "${REPDIR}"
