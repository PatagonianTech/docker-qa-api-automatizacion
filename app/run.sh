#!/usr/bin/env bash

echo "# -> $ /app/node_modules/mocha/bin/mocha --reporter mochawesome $@"

if [ ! -z "$REPDIR" ]; then
  rep_opt="reportDir=${REPDIR}"
fi
if [ ! -z "$REPNAME" ]; then
  [ ! -z "$rep_opt" ] && rep_opt="${rep_opt},"
  rep_opt="${rep_opt}reportFilename=${REPNAME}"
fi
if [ ! -z "$REPTITLE" ]; then
  [ ! -z "$rep_opt" ] && rep_opt="${rep_opt},"
  rep_opt="${rep_opt}reportTitle=${REPTITLE},reportPageTitle=${REPTITLE}"
fi

if [ -z "$REPDIR" ]; then
  echo "default dir --> $rep_opt"
  /app/node_modules/mocha/bin/mocha --reporter mochawesome --reporter-options "$rep_opt"
  chown -R ${HOST_USER}:${HOST_GROUP} mochawesome-reports
else
  echo "custom dir --> $rep_opt"	
  /app/node_modules/mocha/bin/mocha --reporter mochawesome --reporter-options "$rep_opt"
  chown -R ${HOST_USER}:${HOST_GROUP} ${REPDIR}
fi