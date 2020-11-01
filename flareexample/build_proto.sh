#!/bin/bash
protoc --proto_path=. --dart_out=lib/communication/proto/gen lib/communication/proto/messages.proto