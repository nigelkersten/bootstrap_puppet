class packages {

  $packages = ["vim"]

  package { $packages:
    ensure => latest,
  }
}
