#!/bin/bash

echo "=====install go1.13====="
curl -s https://raw.githubusercontent.com/didi/sharingan-go/recorder/install/go1.13 | sh  > /dev/null 2>&1
export GOROOT=/tmp/recorder-go1.13
export PATH=$GOROOT/bin:$PATH

echo "=====build example====="
cd example
go build -tags="recorder"
if [ $? -ne 0 ]; then
   exit 1
fi

go build -tags="replayer" -gcflags="all=-N -l"
if [ $? -ne 0 ]; then
   exit 1
fi
cd -

echo "=====build recorder-agent====="
cd recorder-agent
go build
if [ $? -ne 0 ]; then
   exit 1
fi
cd -

echo "=====build replayer-agent====="
cd replayer-agent
go build
if [ $? -ne 0 ]; then
   exit 1
fi
cd -
