class letsencrypt::install {

  ensure_packages($::letsencrypt::packages, {ensure => latest})

  ensure_packages($::letsencrypt::gems, { ensure => latest, provider => gem })

  exec { 'create-simp_le-virtualenv':
    command => "virtualenv ${::letsencrypt::install_dir}",
    unless  => "test -d ${::letsencrypt::install_dir}",
    before  => Exec['funcsigs-for-letsencrypt']
  }

  exec { 'funcsigs-for-letsencrypt':
    command => "bash -c 'source ${::letsencrypt::install_dir}/bin/activate && pip install -U funcsigs'",
    unless  => "test -d ${::letsencrypt::install_dir}/lib/python2.7/site-packages/funcsigs",
    before  => Exec['simp_le'],
  }

  exec { 'simp_le':
    command => "bash -c 'source ${::letsencrypt::install_dir}/bin/activate && pip install -U git+https://github.com/zenhack/simp_le.git@0.18.1'",
    unless  => "test -f ${::letsencrypt::install_dir}/bin/simp_le",
  }
}
