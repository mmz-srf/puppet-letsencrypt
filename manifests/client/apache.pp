class letsencrypt::client::apache(
  $servername = $::letsencrypt::client::servername,
  $port       = $::letsencrypt::client::port,
) {

  include ::apache::mod::proxy
  include ::apache::mod::proxy_http

  apache::custom_config { 'letsencrypt':
    content => template("letsencrypt/proxy-acme-challenge.conf.erb")
  }
}