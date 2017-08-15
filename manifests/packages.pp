# == Class: unifi::packages
#
# Package installation for a UniFi Controller Muppet
#
# === Authors
#
# Scotty Logan <swl@scottylogan.com>
#
class unifi::packages (
  $package_type,
  $install,
  $uninstall,
  $sources,
) {

  Package { provider => $package_type }

  class { 'apt':
    update  => {
      frequency => 'daily',
    },
    purge   => {
      'sources.list'   => false,
      'sources.list.d' => false,
    },
    sources => $sources,
  }

  # force apt-get update before package installation
  Class['apt::update'] -> Package<| |>

  $only_install = difference($install, $uninstall)

  $installing = join($only_install, ' ')
  $uninstalling = join($uninstall, ' ')

  ensure_packages($only_install, { ensure => present })
  ensure_packages($uninstall, { ensure => absent })

  if ($::osfamily == 'Debian') {
    exec { 'apt-mark':
      command => "/usr/bin/apt-mark manual ${installing}",
      require => Package[$only_install],
    }
  }

}
