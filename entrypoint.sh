#!/bin/sh

echo "::add-matcher::${RUNNER_TEMP}/robocop-matcher.json"

echo "Robocop scan:"

exec 5>&1
res=`{ { robocop --generate-action-matcher; echo $? 1>&4; } 1>&5; } 4>&1`
if [ "$res" = "0" ]; then
    echo "Robocop found no problems"
else
    echo "Robocop found one or more problems"
fi
echo "::remove-matcher owner=robocop-matcher::"

exit $res