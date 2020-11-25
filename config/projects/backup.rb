#
# Copyright 2020 YOUR NAME
#
# All Rights Reserved.
#

name 'backup'
maintainer 'The Backup Maintainers'
homepage 'https://github.com/backup/backup'
license 'MIT'
description 'Easy full stack backup operations on UNIX-like systems.'

# Defaults to C:/backup on Windows
# and /opt/backup on all other platforms
install_dir "#{default_root}/#{name}"

build_version ENV.fetch('BACKUP_VERSION', Omnibus::BuildVersion.semver)
build_iteration ENV.fetch('BACKUP_BUILD', Dir['./pkg/*.deb'].count).to_i

# Creates required build directories
dependency 'preparation'

override :ruby, version: '2.6.6'
override :rubygems, version: '3.0.3'
dependency 'backup'

exclude '**/.git'
exclude '**/bundler/git'
