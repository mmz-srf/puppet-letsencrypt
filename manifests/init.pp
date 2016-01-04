# == Class: letsencrypt
#
# This class installs all dependencies for running simp_le on Debian 7.
#
#
class letsencrypt (
  $servername  = $::letsencrypt::params::servername,
  $packages    = $::letsencrypt::params::packages,
  $install_dir = $::letsencrypt::params::install_dir,
) inherits letsencrypt::params
{
  include letsencrypt::install

  # apache virtualhost for servername
  apache::vhost { $servername:
    servername    => $servername,
    port          => '80',
    docroot       => "/var/www/${servername}",
    docroot_owner => 'root',
    docroot_group => 'root',
    access_log_format => '%{X-Forwarded-For}i %l %V %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %u %T/%D %h',
    directories   => [{
      path           => "/var/www/${servername}",
      allow_override => ['None']
    }
    ]
  }

}
