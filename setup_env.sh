#! /bin/bash
ENV_NAME=my_py_env
sudo apt-get install virtualenv

export PYTHONPATH=
#Then create and activate the virtual environment:
virtualenv ${ENV_NAME}
. ${ENV_NAME}/bin/activate
# pip list
pip install -r requirements.txt
