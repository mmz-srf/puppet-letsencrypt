define letsencrypt::certificate(
  $domains = [],
) {
  include ::letsencrypt

  $joined_domains = join($domains, " ")
  exec { "package letsencrypt certificate for ${name}":
    command => "letsencrypt-package-certificate ${name} ${joined_domains}",
    cwd     => $::letsencrypt::run_dir,
    path    => "/bin:/usr/bin:/usr/local/bin",
    user    => $::letsencrypt::docroot_owner,
    group   => $::letsencrypt::docroot_group,
    require => File[$::letsencrypt::run_dir],
  }
}