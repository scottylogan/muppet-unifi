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

  Package { provider => 'apt' }

  include apt

  apt::source { 'UniFi APT Repo':
    location => 'http://www.ubnt.com/downloads/unifi/debian',
    key      => '4A228B2D358A5094178285BE06E85760C0A52C50',
    release  => 'stable',
    repos    => 'ubiquiti',
  }

  package { 'unifi':
    ensure  => latest,
    require => [
      Apt_Source['UniFi APT Repo'],
      Class['apt::update'],
    ]
  }

  file { '/usr/lib/unifi/data/sites/default/config.gateway.json':
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0640',
    source  => "puppet:///modules/${module_name}/config.gateway.json",
    require => Package['unifi'],
  }

}

