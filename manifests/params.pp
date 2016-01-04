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

  $install_dir = '/opt/letsencrypt'

  $port = '80'
}