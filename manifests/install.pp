class letsencrypt::install {

  ensure_packages($::letsencrypt::packages, {ensure => latest})

  ensure_packages($::letsencrypt::gems, { ensure => latest, provider => gem })

  exec { 'funcsigs-for-letsencrypt':
    command => 'pip install -U funcsigs',
    path    => [ "${::letsencrypt::install_dir}/bin", '/usr/bin'],
    unless  => 'python -c "import funcsigs"',
    before  => Exec['setuptools-for-letsencrypt'],
  }

  exec { 'setuptools-for-letsencrypt':
    command => 'pip install -U setuptools',
    path    => [ "${::letsencrypt::install_dir}/bin", '/usr/bin'],
    unless  => 'python -c \'import setuptools, sys; float(setuptools.__version__) < 17.1 and sys.exit(1)\';',
    before  => Exec['simp_le'],
  }

  exec { 'wheel-for-letsencrypt':
    command => 'pip install -U wheel',
    path    => [ "${::letsencrypt::install_dir}/bin", '/usr/bin'],
    unless  => 'python -c "import wheel"',
    before  => Exec['simp_le'],
  }

  exec { 'simp_le':
    command => 'pip install -U git+https://github.com/zenhack/simp_le.git@master',
    path    => [ '/usr/bin'],
    unless  => 'python -c "import simp_le"',
  }
}