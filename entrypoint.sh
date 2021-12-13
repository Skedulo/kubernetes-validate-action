#!/bin/ash -x

if [ $# -lt 3 ]; then
  echo "expected: $0 <strict(true|false)> <version|latest> <quiet(true|false)> target"
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

if [[ "$3" != "false" ]] ; then
  args="${args} --quiet"
fi

if [ -d "$4" ] ; then
  output=$(find $4 -type f | xargs kubernetes-validate ${args})
  rc=$?
elif [ -f "$4" ] ; then
  output=$(kubernetes-validate ${args} $4)
  rc=$?
else
  echo "unexpected: $4 should be a file or a directory"
  exit 2
fi
output=$(echo $output | sed -z -e 's/%/%25/g' -e "s/\n/%0A/g" -e "s/\r/%0D/g")
echo "::set-output name=output::${output}"
exit $rc
