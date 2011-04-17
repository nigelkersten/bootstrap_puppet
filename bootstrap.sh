#!/bin/bash

# need git and Ruby
# need git repos in ~nigel/src/{puppet,facter}

DIR="$( cd "$( dirname "$0" )" && pwd )"

export ENVPUPPET_BASEDIR="/home/nigel/src"
PUPPET='/home/nigel/src/puppet/ext/envpuppet puppet'
FACTER='/home/nigel/src/puppet/ext/envpuppet facter'

alias puppet="${PUPPET}"
alias facter="${FACTER}"

$PUPPET apply -v --modulepath="${DIR}/modules" "${DIR}/manifests/site.pp"

