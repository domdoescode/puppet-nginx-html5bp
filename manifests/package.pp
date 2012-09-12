class nginx::package {
  package { 'nginx':
    ensure => present,
  }
}
