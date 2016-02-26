class letsencrypt::install {

  ensure_packages($::letsencrypt::packages, {ensure => latest})

  ensure_packages($::letsencrypt::gems, { ensure => latest, provider => gem })

  exec { "virtualenv-for-letsencrypt":
    command => "virtualenv --no-site-packages ${::letsencrypt::install_dir}",
    cwd     => "/var/tmp",
    creates => $::letsencrypt::install_dir,
    path    => ["/usr/bin"],
    require => Package['python-virtualenv'],
  }

  exec { 'funcsigs-for-letsencrypt':
    command => 'pip install -U funcsigs',
    cwd     => $::letsencrypt::install_dir,
    path    => [ "${::letsencrypt::install_dir}/bin", '/usr/bin'],
    unless  => 'python -c "import funcsigs"',
    require => Exec['virtualenv-for-letsencrypt'],
    before  => Exec['setuptools-for-letsencrypt'],
  }

  exec { 'setuptools-for-letsencrypt':
    command => 'pip install -U setuptools',
    cwd     => $::letsencrypt::install_dir,
    path    => [ "${::letsencrypt::install_dir}/bin", '/usr/bin'],
    unless  => 'python -c \'import setuptools, sys; float(setuptools.__version__) < 17.1 and sys.exit(1)\';',
    require => Exec['virtualenv-for-letsencrypt'],
    before  => Exec['simp_le'],
  }

  exec { 'wheel-for-letsencrypt':
    command => 'pip install -U wheel',
    cwd     => $::letsencrypt::install_dir,
    path    => [ "${::letsencrypt::install_dir}/bin", '/usr/bin'],
    unless  => 'python -c "import wheel"',
    require => Exec['virtualenv-for-letsencrypt'],
    before  => Exec['simp_le'],
  }

  exec { 'simp_le':
    command => 'pip install -U git+https://github.com/kuba/simp_le.git@master',
    cwd     => $::letsencrypt::install_dir,
    path    => [ "${::letsencrypt::install_dir}/bin", '/usr/bin'],
    unless  => 'python -c "import simp_le"',
  }

}