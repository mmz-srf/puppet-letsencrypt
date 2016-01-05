class letsencrypt::client (
  $type       = '::letsencrypt::client::apache',
  $servername = $::letsencrypt::servername,
  $port       = $::letsencrypt::port,
) inherits letsencrypt {
  include $type
}