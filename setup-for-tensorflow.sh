#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
$SCRIPT_DIR/setup-for-pyenv.sh

pip install --upgrade pip
pip install tensorflow
