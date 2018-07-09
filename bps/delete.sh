#!/bin/sh

FABRIC = ~/fabric-dev-servers

~/fabric-dev-servers/teardownAllDocker.sh

~/fabric-dev-servers/teardownFabric.sh

~/fabric-dev-servers/startFabric.sh

./deploy.sh
