#!/bin/bash

# This script executes a set of BackstopJS tests.

# Uses this > https://hub.docker.com/r/backstopjs/backstopjs/

BIN_PATH=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
TEST_ROOT=${BIN_PATH}/../test

# Remove the old test data.
rm -rf ${TEST_ROOT}/backstop_data

if [ "$1" ]; then
	# Run the tests and open the report.
	docker run --rm -v ${TEST_ROOT}:/src backstopjs/backstopjs reference --config=$1
	docker run --rm -v ${TEST_ROOT}:/src backstopjs/backstopjs test --config=$1
	open ${TEST_ROOT}/backstop_data/html_report/index.html
else
	# Run the tests and open the report.
	docker run --rm -v ${TEST_ROOT}:/src backstopjs/backstopjs reference
	docker run --rm -v ${TEST_ROOT}:/src backstopjs/backstopjs test
	open ${TEST_ROOT}/backstop_data/html_report/index.html
fi
