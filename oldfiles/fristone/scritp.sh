#!/bin/bash
# greet.sh: A simple greeting script that takes two parameters.
# $1: First name
# $2: Last name

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <FirstName> <LastName>"
  exit 1
fi

echo "Hello $1 $2"
