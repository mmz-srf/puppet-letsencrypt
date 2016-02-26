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

  $port = '80'

  $docroot = '/var/www/letsencrypt'
  $docroot_owner = 'jenkins'
  $docroot_group = 'jenkins'

  $contact_email = ''
}