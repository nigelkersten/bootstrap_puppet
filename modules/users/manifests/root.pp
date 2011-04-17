class users::root {

  $src = "/home/nigel/src"
  File { require => Vcsrepo["${src}/dotfiles"], }

  user { 'root':
    ensure   => 'present',
    comment  => 'root',
    gid      => '0',
    home     => '/root',
    password => '$6$WaEO8W/E$FH.JsZlxyPZzcYAFKGCxpVVM1iEqfeWvNLg5oMpyASR05DAFkCiuuWnAMQShH3WJTFbIbpxVmbR6wXLGkolzX/',
    shell    => '/bin/bash',
    uid      => '0',
  }

  file { "/root/.bashrc":
    ensure => file,
    content => "export ENVPUPPET_BASEDIR=~nigel/src
alias puppet='~nigel/src/puppet/ext/envpuppet puppet'
alias facter='~nigel/src/puppet/ext/envpuppet facter'",
  }

}
