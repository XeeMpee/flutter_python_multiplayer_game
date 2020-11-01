#!/bin/bash

for i in -$@; do
  case $1 in
    --build=*)
      target="${i#*=}"
      bash ./build_proto.sh $@
      flutter packages get
      flutter build $target 
      ;;
    --uid=*)
      userid="${i#*=}"
      chown -R $userid build/
      ;;
    --gid=*)
      groupid="${i#*=}"
      chgrp -R $groupid build/
      ;;
    *)
      echo "Invalid Option!"
      exit 1
      ;;
  esac
  shift
done
