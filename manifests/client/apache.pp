class letsencrypt::client::apache(
  $servername = $::letsencrypt::client::servername,
  $port       = $::letsencrypt::client::port,
  $docroot    = $::letsencrypt::client::docroot,
) {

  if defined(Letsencrypt::Server) {
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