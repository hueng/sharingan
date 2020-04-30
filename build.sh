#!/bin/bash

curl https://raw.githubusercontent.com/didi/sharingan-go/recorder/install/go1.13 | sh
export GOROOT=/tmp/recorder-go1.13
export PATH=$GOROOT/bin:$PATH

cd example
go build -tags="recorder"
go build -tags="replayer" -gcflags="all=-N -l"
cd -

cd recorder-agent
go build
cd -

cd replayer-agent
go build
cd -
