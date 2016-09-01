#!/bin/sh
/root/.c9/node/bin/node /opt/c9sdk/server.js \
    --listen 0.0.0.0 \
    --port 8181 \
    -a $USERNAME:$PASSWORD \
    -w /workspace
