#!/bin/bash

# need git and Ruby
# need git repos in ~nigel/src/{puppet,facter}

DIR="$( cd "$( dirname "$0" )" && pwd )"

export ENVPUPPET_BASEDIR=~nigel/src
alias puppet='~nigel/src/puppet/ext/envpuppet puppet'
alias facter='~nigel/src/puppet/ext/envpuppet facter'
alias irb='~nigel/src/puppet/ext/envpuppet irb'

puppet apply -v --modulepath="${DIR}/modules" --manifest="${DIR}/manifests/site.pp"
