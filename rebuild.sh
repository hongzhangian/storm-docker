#!/bin/bash

docker build -t="hongzhangian/storm" storm
docker build -t="hongzhangian/storm-nimbus" storm-nimbus
docker build -t="hongzhangian/storm-supervisor" storm-supervisor
docker build -t="hongzhangian/storm-ui" storm-ui
