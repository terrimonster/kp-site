class kp::params {
  $domain = $::operatingsystem ? {
    'redhat' => 'redhatblog.kp.org',
    'ubuntu' => 'ubuntublog.kp.org',
    'centos' => 'centosblog.kpg.org',
    default => 'kpblog.kp.org',
  }
  $port = '80'
  $docroot = $::osfamily ? {
    'redhat' => '/var/www/html',
    'debian' => '/var/www',
    default => '/var/www/html',
  }
}
