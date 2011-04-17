class users::nigel {

  include users::nigel::config

  user { 'nigel':
    ensure           => 'present',
    comment          => 'nigel,,,',
    gid              => '1000',
    home             => '/home/nigel',
    managehome       => true,
    password         => '$6$fPUohVXH$bYZY38RJIKKUK9fF6U/taOZfOwFdRoBnRkZOV71lGIWVMj96nOwWOAMp5EGbfJUjbrnHP/EvszbRkZgWYRkL3.',
    shell            => '/bin/bash',
    uid              => '1000',
  }

  group { 'nigel':
    ensure => 'present',
    gid    => '1000',
  }

  file { "/home/nigel":
    ensure => directory,
    mode  => 0755,
    owner => nigel,
    group => nigel,
  }

}
