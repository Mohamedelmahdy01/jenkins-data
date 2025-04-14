#!/bin/bash
# greet_with_condition.sh: Greets only if SHOW_DETAILS is true.
# $1: First name, $2: Last name, $SHOW_DETAILS: Boolean parameter
NAME=$1
LAST_NAME=$2
SHOW_DETAILS=$3


if [ "${SHOW_DETAILS}" = "true" ]; then
  echo "Hello $1 $2"
else
  echo "Enable SHOW_DETAILS to view the full greeting."
fi
