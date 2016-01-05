class letsencrypt::server()
inherits letsencrypt {

  include letsencrypt::install

  # apache virtualhost for servername
  apache::vhost { "letsencrypt":
    servername    => $servername,
    port          => $port,
    default_vhost => true,
    docroot       => "/var/www/letsencrypt",
    docroot_owner => $docroot_owner,
    docroot_group => $docroot_group,
    access_log_format => '%{X-Forwarded-For}i %l %V %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %u %T/%D %h',
    directories   => [{
      path           => "/var/www/letsencrypt",
      allow_override => ['None']
    }
    ]
  }
}