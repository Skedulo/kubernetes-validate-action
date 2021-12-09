#!/bin/sh -l

args=""
if [[ "$1" != "false" ]] ; then
  args="${args} --strict"
fi
if [[ "$2" != "latest" ]] ; then
  args="${args} -k ${2}"
fi

output=$(kubernetes-validate ${args} $3)

echo "::set-output name=output::$output"
