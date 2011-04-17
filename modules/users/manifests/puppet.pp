class users::puppet {

  user { 'puppet':
    ensure           => 'present',
    home             => '/home/puppet',
    password         => '!',
  }
  group { 'puppet':
    ensure => 'present',
  }

}
