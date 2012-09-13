class nginx::config inherits nginx::params {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { "${nginx::params::nx_conf_dir}":
    ensure  => directory,
  }

  file { "${nginx::params::nx_conf_dir}/conf.d":
    ensure  => directory,
  }

  file { "${nginx::config::nx_run_dir}":
    ensure  => directory,
  }

  file { "${nginx::config::nx_client_body_temp_path}":
    ensure  => directory,
    owner   => $nginx::params::nx_daemon_user,
  }

  file {"${nginx::config::nx_proxy_temp_path}":
    ensure  => directory,
    owner   => $nginx::params::nx_daemon_user,
  }

  file { "${nginx::config::nx_conf_dir}/sites-enabled":
    ensure  => directory,
  }

  file { "${nginx::config::nx_conf_dir}/sites-enabled/default":
    ensure  => absent,
  }

  file { "${nginx::config::nx_conf_dir}/mime.types":
    source  => 'puppet:///modules/nginx/mime.types',
  }

  file { "${nginx::config::nx_conf_dir}/conf":
    source  => 'puppet:///modules/nginx/conf',
    ensure  => directory,
    recurse => true,
  }

  file { "${nginx::params::nx_conf_dir}/nginx.conf":
    ensure  => file,
    content => template('nginx/nginx.conf.erb'),
  }
}
