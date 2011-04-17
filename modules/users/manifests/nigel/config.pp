class users::nigel::config {

  File { owner => nigel, group => nigel, mode => 0644, }

  file { "/home/nigel/.vimswp":
    ensure => directory,
  }

}
