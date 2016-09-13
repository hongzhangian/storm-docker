#!/bin/bash

STORM_VERSION="1.0.2"

docker build -t="hongzhangian/storm" storm --build-arg STORM_VERSION=${STORM_VERSION}
docker build -t="hongzhangian/storm-nimbus" storm-nimbus
docker build -t="hongzhangian/storm-supervisor" storm-supervisor
docker build -t="hongzhangian/storm-ui" storm-ui
