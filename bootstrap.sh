#!/bin/bash

# need git and Ruby
# need git repos in ~nigel/src/{puppet,facter}

DIR="$( cd "$( dirname "$0" )" && pwd )"

export ENVPUPPET_BASEDIR="/home/nigel/src"
PUPPET='/home/nigel/src/puppet/ext/envpuppet puppet'
FACTER='/home/nigel/src/puppet/ext/envpuppet facter'

mkdir -p "${ENVPUPPET_BASEDIR}"
pushd "${ENVPUPPET_BASEDIR}"

if [ ! -d "/home/nigel/src/puppet" ]; then
  git clone git://github.com/puppetlabs/puppet.git
fi

if [ ! -d "/home/nigel/src/facter" ]; then
  git clone git://github.com/puppetlabs/facter.git
fi
popd

alias puppet="${PUPPET}"
alias facter="${FACTER}"

$PUPPET apply -v --modulepath="${DIR}/modules" "${DIR}/manifests/site.pp"

