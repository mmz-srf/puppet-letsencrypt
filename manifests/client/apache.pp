class letsencrypt::client::apache(
  $servername = $::letsencrypt::client::servername,
  $port       = $::letsencrypt::client::port,
  $docroot    = $::letsencrypt::client::docroot,
) {
  $apache_version = $::apache::apache_version
  $letsencrypt_install_dir = $::letsencrypt::install_dir

  if $apache_version == '2.4' and !defined(Apache::Mod['authz_host']) {
    ::apache::mod { 'authz_host': }
  }

  if defined(Apache::Vhost['letsencrypt']) {
    apache::custom_config { 'letsencrypt':
      content => template("letsencrypt/map-acme-challenge.conf.erb")
    }
  } else {
    include ::apache::mod::proxy
    include ::apache::mod::proxy_http

    apache::custom_config { 'letsencrypt':
      content => template("letsencrypt/proxy-acme-challenge.conf.erb")
    }
  }
}
