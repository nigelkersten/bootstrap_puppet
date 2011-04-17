class users::nigel::config {

  $home = "/home/nigel"
  $src  = "${home}/src"

  File {
        owner   => nigel,
        group   => nigel,
        mode    => 0644,
        require => Vcsrepo["${src}/dotfiles",
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
}
