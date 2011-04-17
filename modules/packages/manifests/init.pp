class packages {

Package { ensure => latest, }

$pkgs_common = []
$pkgs_redhat = ["vim-enhanced", "ruby-shadow", ]
$pkgs_debian = ["vim", "libshadow-ruby1.8", ]

package { $pkgs_common: }

case $operatingsystem {
  redhat, centos: {
    package { $pkgs_redhat: }
  }
  debian: {
    package { $pkgs_debian: }
  }
}

