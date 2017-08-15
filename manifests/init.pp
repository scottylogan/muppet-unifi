# == Class: unifi
#
# Configuration for a UniFi ControllerMuppet.
#
# === Parameters
#
# none
#
# === Variables
#
# none
#
# === Examples
#
#  include unifi
#
# === Authors
#
# Scotty Logan <scotty@scottylogan.com>
#
class unifi {

  include unifi::packages

  file { '/usr/lib/unifi/data/sites/default/config.gateway.json':
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0640',
    source  => "puppet:///modules/${module_name}/config.gateway.json",
    require => Package['unifi'],
  }
}

