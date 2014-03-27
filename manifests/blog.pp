class kp::blog (
  $domain = $kp::params::domain,
  $port = $kp::params::port,
  $docroot = $kp::params::docroot,
) {
  host { $domain:
    ip => $::ipaddress,
  }
  #Configuration of php-enabled webserver
  class { 'apache':
    mpm_module => 'prefork',
  }
  include apache::mod::php
    apache::vhost { $domain :
      port    => $port,
      docroot => $docroot,
    }
    #Configuration MySQL server
  class { '::mysql::server':
    root_password    => 'strongpassword',
  }
    #PHP 5.3 or greater
  class { 'mysql::bindings':
    php_enable => 'true',
  }

  class { 'wordpress':
    install_dir => $docroot,
    db_name => 'wordpress',
    db_host => 'localhost',
    db_user => 'wordpress',
    db_password => 'insecure password',
  }
}
