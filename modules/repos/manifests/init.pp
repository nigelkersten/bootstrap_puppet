class repos {

  Vcsrepo { ensure => present, provider => "git", }

  $repo_root = "/home/nigel/src"

  file { "${repo_root}":
    ensure => directory,
    mode   => 0755,
    owner  => nigel,
    group  => nigel,
  }

  vcsrepo { "${repo_root}/puppet":
    source   => "git://github.com/puppetlabs/puppet.git",
  }

  vcsrepo { "${repo_root}/facter":
    source   => "git://github.com/puppetlabs/facter.git",
  }

}
