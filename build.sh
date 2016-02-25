#!/bin/bash

go get github.com/mitchellh/gox
mkdir -p $GOPATH/src/github.com/hashicorp/
cd $GOPATH/src/github.com/hashicorp/
git clone https://github.com/hashicorp/nomad.git
cd nomad
GITCOM=$(git rev-parse --verify HEAD)
OUTFILE="/out/nomad.${GITCOM:0:7}.zip"
if [ -f $OUTFILE ]
  then
  echo "bestaat al"
  exit 1;
fi
make bootstrap
make bin
cp /go/src/github.com/hashicorp/nomad/pkg/linux_amd64.zip $OUTFILE