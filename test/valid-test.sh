#! /usr/bin/env bash

cd ${0%/*}
fails=0
i=0
tests=`ls valid/*.json -1l | wc -l`
echo "1..$tests"
for input in valid/*.json
do
  expected="${input%.json}.parsed"
  let i++
  if ! ../bin/json_parse < "$input" | diff -u - "$expected" 
  then
    echo "not ok $i - $input"
    let fails=$fails+1
  else
    echo "ok $i - $input"    
  fi
done
echo "$fails test(s) failed"
exit $fails
