#!/bin/sh

function escape_whitespace {
  local result="$1"
  result="${result//'%'/'%25'}"
  result="${result//$'\n'/'%0A'}"
  result="${result//$'\r'/'%0D'}"
  echo "$result"
}

if [ $# -lt 3 ]; then
  echo "expected: $0 <strict(true|false)> <version|latest> target"
  echo "got: $@"
  exit 1
fi

args=""
if [[ "$1" != "false" ]] ; then
  args="${args} --strict"
fi

if [[ "$2" != "latest" ]] ; then
  args="${args} -k ${2}"
fi

if [ -d "$3" ] ; then
  output=$(find $3 -type f | xargs kubernetes-validate --quiet ${args})
  rc=$?
elif [ -f "$3" ] ; then
  output=$(kubernetes-validate --quiet ${args} $3)
  rc=$?
else
  echo "unexpected: $3 should be a file or a directory"
  exit 2
fi

echo "::set-output name=output::$(escape_whitespace $output)"
exit $rc
