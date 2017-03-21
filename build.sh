#!/bin/bash

# Ex 1:
# $ export TEST_MOCHA_NAME=test1
# $ ./build.sh

# Ex 2:
# $ TEST_MOCHA_NAME=test1 ./build.sh


if [ -z "$TEST_MOCHA_NAME" ]; then
	export TEST_MOCHA_NAME=testAPI-generic
fi

docker build --no-cache -t $TEST_MOCHA_NAME .
