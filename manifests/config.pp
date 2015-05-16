# Class: activemq::config
#
#   class description goes here.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class activemq::config (
  $server_config,
  $manage_config,
  $instance,
  $package,
  $path = '/etc/activemq/activemq.xml'
) {

  # Resource defaults
  File {
    owner   => 'activemq',
    group   => 'activemq',
    mode    => '0644',
    notify  => Service['activemq'],
    require => Package[$package],
  }


  if $::osfamily == 'Debian' {
    $available = "/etc/activemq/instances-available/${instance}"
    $path_real = "${available}/activemq.xml"

    file { $available:
      ensure => directory,
    }

    file { "/etc/activemq/instances-enabled/${instance}":
      ensure => link,
      target => $available,
    }
  }
  else {
    validate_re($path, '^/')
    $path_real = $path
  }

  file {'/usr/share/activemq/conf/activemq-wrapper.conf' :
    ensure => file,
    content => template("activemq/default/activemq-wrapper.conf"),
    mode => '0755'
  }


  if $manage_config {
    # The configuration file itself.
    file { 'activemq.xml':
      ensure  => file,
      path    => $path_real,
      owner   => '0',
      group   => '0',
      content => $server_config,
    }
  }

}
