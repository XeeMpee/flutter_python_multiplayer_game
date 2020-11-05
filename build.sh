#!/bin/bash
docker run -v $PWD/flareexample:/workspace -it -t fluttergame `pushd /workspace; flutter packages get; flutter build web; flutter build apk; popd;`
