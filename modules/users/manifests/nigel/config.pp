class users::nigel::config {

  $home = "/home/nigel"
  $src  = "${home}/src"

  File {
        owner   => nigel,
        group   => nigel,
        mode    => 0644,
        require => Vcsrepo["${src}/dotfiles"],
       }

  vcsrepo { "${src}/dotfiles":
    ensure   => present,
    provider => "git",
    source   => "git://github.com/nigelkersten/dotfiles.git",
  }

  file { "${home}/.vimswp":
    ensure => directory,
  }

  file { "${home}/.vimrc":
    ensure => symlink,
    target => "${src}/dotfiles/vimrc",
  }

  file { "${home}/.vim":
    ensure => symlink,
    target => "${src}/dotfiles/vim",
  }

  file { "${home}/.bashrc":
    ensure => symlink,
    target => "${src}/dotfiles/bashrc",
  }

  file { "${home}/.ssh":
    ensure => directory,
    mode   => 0700,
  }

  file { "${home}/.ssh/authorized_keys":
    ensure => file,
    source => "puppet:///modules/users/nigel/authorized_keys",
  }

}
