# == Class: letsencrypt
#
# This class installs all dependencies for running simp_le on Debian 7 / Debian 8.
#
#
class letsencrypt (
  $servername  = $::letsencrypt::params::servername,
  $port        = $::letsencrypt::params::port,
  $packages    = $::letsencrypt::params::packages,
  $gems        = $::letsencrypt::params::gems,
  $install_dir = $::letsencrypt::params::install_dir,
  $docroot       = $::letsencrypt::params::docroot,
  $docroot_owner = $::letsencrypt::params::docroot_owner,
  $docroot_group = $::letsencrypt::params::docroot_group,
  $contact_email = $::letsencrypt::params::contact_email,
) inherits letsencrypt::params
{

}
