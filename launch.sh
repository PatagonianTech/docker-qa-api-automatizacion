#!/bin/bash

# Ex 1:
# $ export TEST_MOCHA_NAME=test1
# $ ./launch.sh

# Ex 2:
# $ TEST_MOCHA_NAME=test1 ./launch.sh path_to_tests/my_test.js

if [ -z "$TEST_MOCHA_NAME" ]; then
	export TEST_MOCHA_NAME=testAPI-generic
fi

echo "Starting...."
docker run -it --rm --net=host \
  -v "$(pwd):/app/context" \
  -e HOST_USER=$UID \
  -e HOST_GROUP=$(id -g $USERNAME) \
  -e REPDIR="./reporte" \
  -e REPNAME="ApiRest" \
  -e REPTITLE="Titulo" \
  $TEST_MOCHA_NAME -- $@

# DEBUG: docker run -it --rm --net=host -e HOST_USER=$UID -e HOST_GROUP=$(id -g $USERNAME) -v "$(pwd):/app/context" --entrypoint /bin/bash mocha-generic -c bash

# ./launcher.sh "test/test   3.js"
# $1 ==> "test/test" -> $2 => "3.js"
# $* ==> "test/test 3.js"
# $@ ==> "test/test" "3.js"

#alias 'run-test'='docker run -it --rm --net=host -e HOST_USER=$UID -e HOST_GROUP=$(id -g $USERNAME) -v "$(pwd):/app/context" mocha-generic'
# docker run -it --rm --net=host -e HOST_USER=$UID -e HOST_GROUP=$(id -g $USERNAME) -e REPDIR="./reporte" -v "$(pwd):/app/context" mocha-generic
# docker run -it --rm --net=host -e HOST_USER=$UID -e HOST_GROUP=$(id -g $USERNAME) -e REPDIR="./reporte" -e REPNAME="ApiRest" -e REPTITLE="Titulo" -v "$(pwd):/app/context" mocha-generic test.js
