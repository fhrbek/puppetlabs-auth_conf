class auth_conf {
  include concat::setup

  $is_pe = str2bool($::is_pe)

  $auth_conf_path = $is_pe ? {
    true      => '/etc/puppetlabs/puppet/auth.conf',
    false     => '/etc/puppet/auth.conf',
    default   => '/etc/puppet/auth.conf'
  }


  if $::custom_auth_conf == 'true' {
    include auth_conf::modified_warning
  } else {
    concat { $auth_conf_path:
      owner => 0,
      group => 0,
      mode  => '0644',
    }
  }
}
