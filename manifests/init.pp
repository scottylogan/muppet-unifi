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

  apt::source { 'unifi-stable':
    location => 'http://www.ubnt.com/downloads/unifi/debian',
    key      => '4A228B2D358A5094178285BE06E85760C0A52C50',
    release  => 'stable',
    repos    => 'ubiquiti',
    before   => Package['unifi'],
  }

  package { 'java8':
    ensure => latest,
    name   => 'oracle-java8-jdk',
  }

  package { 'unifi':
    ensure  => latest,
    require => [
      Package['java8'],
      Class['apt::update'],
    ]
  }

  file {
    [
      '/var/log/unifi',
      '/var/lib/unifi',
      '/var/lib/unifi/backup',
      '/var/lib/unifi/db',
      '/var/lib/unifi/sites',
    ]:
    ensure  => directory,
    owner   => 'unifi',
    group   => 0,
    mode    => '0750',
    require => Package['unifi'],
  }
}

