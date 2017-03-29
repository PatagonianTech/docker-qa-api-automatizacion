#!/bin/bash

# Ex 1:
# $ export TEST_MOCHA_NAME=test1
# $ ./build.sh

# Ex 2:
# $ TEST_MOCHA_NAME=test1 ./build.sh


if [ -z "$TEST_MOCHA_NAME" ]; then
	export TEST_MOCHA_NAME=testapi-generic
fi

#docker build --no-cache -t $TEST_MOCHA_NAME .

TITLE="Define Env Variable for Docker image and add a global run command"

installAlias() {
  local f="$1"
  if [ -f "$f" ]; then
    if ! grep -q "${TITLE}" "$f"
      then  
        echo '' >> "$f"
        echo "# ${TITLE}" >> "$f"
        echo "export TEST_MOCHA_NAME='$TEST_MOCHA_NAME'" >> "$f"
        echo "alias 'run-test-api'='docker run -it --rm --net=host -v \"\$(pwd):/app/context\" -e HOST_USER=\$UID -e HOST_GROUP=\$(id -g \$USERNAME) -e REPDIR=\"./reporte\" -e REPNAME=\"ApiRest\" -e REPTITLE=\"Titulo\" \$TEST_MOCHA_NAME -- \$@'" >> "$f"
        echo '' >> "$f"
      fi
  fi
}

installAlias ~/.bashrc
installAlias ~/.zshrc
installAlias ~/.shrc
