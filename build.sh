#!/bin/bash

curl -s https://raw.githubusercontent.com/didi/sharingan-go/recorder/install/go1.13 | sh
export GOROOT=/tmp/recorder-go1.13
export PATH=$GOROOT/bin:$PATH

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

cd recorder-agent
go build
if [ $? -ne 0 ]; then
   exit 1
fi
cd -

cd replayer-agent
go build
if [ $? -ne 0 ]; then
   exit 1
fi
cd -
