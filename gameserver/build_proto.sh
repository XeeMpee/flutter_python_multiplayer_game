#!/bin/bash
protoc --proto_path=. --python_out=messages/proto/gen messages/proto/messages.proto
