#!/bin/ash

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
  output=$(find $3 -type f | xargs kubernetes-validate --quiet ${args} | sed -z -e 's/%/%25/g' -e "s/\n/%0A/g" -e "s/\r/%0D/g")
  rc=$?
elif [ -f "$3" ] ; then
  output=$(kubernetes-validate --quiet ${args} $3 | sed -z -e 's/%/%25/g' -e "s/\n/%0A/g" -e "s/\r/%0D/g")
  rc=$?
else
  echo "unexpected: $3 should be a file or a directory"
  exit 2
fi

echo "::set-output name=output::${output}"
exit $rc
