class packages {

  package { "vim":
    ensure => latest,
    name   => $operatingsystem ? {
      "centos" => "vim-enhanced",
      "debian" => "vim",
    },
  }
}
