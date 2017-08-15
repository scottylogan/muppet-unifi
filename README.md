# unifi

#### Table of Contents

1. [Description](#description)
1. [Setup](#setup)
    * [What unfi affects](#what-unifi-affects)
    * [Setup requirements](#setup-requirements)
1. [Usage](#usage)
1. [Limitations](#limitations)
1. [Development](#development)

## Description

This module installs the UniFi Controller package on Debian or Ubuntu systems, along with a
`config.gateway.json` file to configure Comcast IPv6 (and enable IPv6 on some VLANs).

## Setup

### What unifi affects

*unifi* sets up the UniFi APT repo, and installs the `unifi` package and its dependencies.

### Setup requirements

Puppet 4.x must already be installed for *unfi* to work. Extra Puppet
module requirements are defined in _metadata.json_ and _Puppetfile_, so
`librarian-puppet` should be used to ensure all module dependencies are
resolved.

## Usage

Some of the configuration is managed by Hiera, using the data files under _data_
and the hierarchy defined in _hiera.yaml_.

## Limitations

*unifi* has been tested on Ubuntu Xenial.

## Development

Submit issues / merge requests on
[github.com](https://github.com/scottylogan/muppet-unifi/).





