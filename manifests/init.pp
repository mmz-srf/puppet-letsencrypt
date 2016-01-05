# == Class: letsencrypt
#
# This class installs all dependencies for running simp_le on Debian 7.
#
#
class letsencrypt (
  $servername  = $::letsencrypt::params::servername,
  $port        = $::letsencrypt::params::port,
  $packages    = $::letsencrypt::params::packages,
  $install_dir = $::letsencrypt::params::install_dir,
  $docroot_owner = $::letsencrypt::params::docroot_owner,
  $docroot_group = $::letsencrypt::params::docroot_group,
) inherits letsencrypt::params
{

}
