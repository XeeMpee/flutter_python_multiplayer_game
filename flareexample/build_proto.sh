#!/bin/bash
path="lib/communication/proto/gen"

rm -rf $path
mkdir -p $path
protoc --proto_path=. --dart_out=lib/communication/proto/gen lib/communication/proto/messages.proto

for i in -$@; do
  case $1 in
    --uid=*)
      userid="${i#*=}"
      chown -R $userid $path
      ;;
    --gid=*)
      groupid="${i#*=}"
      chgrp -R $groupid $path
      ;;
  esac
  shift
done
