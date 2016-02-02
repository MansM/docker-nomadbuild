#!/bin/bash

go get github.com/mitchellh/gox
mkdir -p $GOPATH/src/github.com/hashicorp/
cd $GOPATH/src/github.com/hashicorp/
git clone https://github.com/hashicorp/nomad.git
cd nomad
make bootstrap
make bin
cp /go/src/github.com/hashicorp/nomad/pkg/linux_amd64.zip /out/nomad.zip