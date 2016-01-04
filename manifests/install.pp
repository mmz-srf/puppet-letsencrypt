class letsencrypt::install {

  ensure_packages($::letsencrypt::packages, {ensure => latest})


  exec { "virtualenv-for-letsencrypt":
    command => "virtualenv --no-site-packages ${::letsencrypt::install_dir}",
    cwd     => "/var/tmp",
    creates => $::letsencrypt::install_dir,
    path    => ["/usr/bin"]
  }

  exec { 'setuptools-for-letsencrypt':
    command => 'pip install -U setuptools',
    cwd     => $::letsencrypt::install_dir,
    path    => [ "${::letsencrypt::install_dir}/bin", '/usr/bin'],
  }

  exec { 'wheel-for-letsencrypt':
    command => 'pip install -U wheel',
    cwd     => $::letsencrypt::install_dir,
    path    => [ "${::letsencrypt::install_dir}/bin", '/usr/bin'],
  }

  exec { 'simp_le':
    command => 'pip install -U git+https://github.com/kuba/simp_le.git@master',
    cwd     => $::letsencrypt::install_dir,
    path    => [ "${::letsencrypt::install_dir}/bin", '/usr/bin'],
  }

}