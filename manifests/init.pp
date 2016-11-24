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
  $run_dir     = $::letsencrypt::params::run_dir,
  $install_dir = $::letsencrypt::params::install_dir,
  $docroot       = $::letsencrypt::params::docroot,
  $docroot_owner = $::letsencrypt::params::docroot_owner,
  $docroot_group = $::letsencrypt::params::docroot_group,
  $contact_email = $::letsencrypt::params::contact_email,
  $packagename_prefix  = $::letsencrypt::params::packagename_prefix,
  $package_install_dir = $::letsencrypt::params::package_install_dir,
  $valid_days = $::letsencrypt::params::valid_days,
  $tos_sha256 = $::letsencrypt::params::tos_sha256,
) inherits letsencrypt::params
{
  $valid_seconds = 24 * 60 * 60 * $valid_days
}
