class nginx {

  class { 'nginx::package':
    notify => Class['nginx::service'],
  }

  class { 'nginx::config':
    require => Class['nginx::package'],
    notify  => Class['nginx::service'],
  }

  class { 'nginx::service': }
}
