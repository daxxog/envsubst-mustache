#!/bin/bash
_ENVSUBST_LOCATION=$(which envsubst)
rm ${_ENVSUBST_LOCATION}
ln -s $(pyenv root)/bin/envsubst-mustache ${_ENVSUBST_LOCATION}
