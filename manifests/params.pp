class letsencrypt::params {

  if($::fqdn) {
    $servername = $::fqdn
  } else {
    $servername = $::hostname
  }

  $packages = [
    'ca-certificates',
    'gcc',
    'libssl-dev',
    'libffi-dev',
    'python',
    'python-dev',
    'python-pip',
    'python-virtualenv',
  ]

  $gems = [
    'fpm',
  ]

  $install_dir = '/opt/letsencrypt'
  $run_dir = '/var/run/letsencrypt'

  $port = '80'

  $docroot = '/var/www/letsencrypt'
  $docroot_owner = 'jenkins'
  $docroot_group = 'jenkins'

  $contact_email = ''

  $packagename_prefix = 'letsencrypt'
  $package_install_dir= '/etc/apache2/ssl'

  $valid_days = 40

  # see https://github.com/kuba/simp_le/issues/114#issuecomment-236744611
  # and https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion/issues/277
  $tos_sha256 = 'cc88d8d9517f490191401e7b54e9ffd12a2b9082ec7a1d4cec6101f9f1647e7b'
}
