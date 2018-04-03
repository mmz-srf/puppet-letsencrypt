class letsencrypt::params {

  if($::fqdn) {
    $servername = $::fqdn
  } else {
    $servername = $::hostname
  }

  $packages = [
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
}
