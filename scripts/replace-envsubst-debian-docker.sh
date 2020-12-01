#!/bin/bash
_ENVSUBST_LOCATION=$(which envsubst)
rm ${_ENVSUBST_LOCATION}
ln -s $(python3 -m site | grep USER_BASE | python3 -c "import sys;sys.stdout.write(list(sys.stdin)[0].split('\'')[1])")/bin/envsubst-mustache ${_ENVSUBST_LOCATION}
