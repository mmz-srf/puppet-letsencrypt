class letsencrypt::server()
inherits letsencrypt {

  include letsencrypt::install

  # apache virtualhost for servername
  apache::vhost { "letsencrypt":
    servername    => $servername,
    port          => $port,
    default_vhost => true,
    docroot       => $docroot,
    docroot_owner => $docroot_owner,
    docroot_group => $docroot_group,
    access_log_format => '%{X-Forwarded-For}i %l %V %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %u %T/%D %h',
    directories   => [{
      path           => $docroot,
      allow_override => ['None']
    }
    ]
  }

  # helper script for creating / renewing certificates and package them
  file { '/usr/local/bin/letsencrypt-package-certificate':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0755,
    content => template('package-certificate.bash.erb'),
  }
}