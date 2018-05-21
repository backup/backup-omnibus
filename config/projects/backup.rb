#
# Copyright 2018 YOUR NAME
#
# All Rights Reserved.
#

name "backup"
maintainer "CHANGE ME"
homepage "https://CHANGE-ME.com"

# Defaults to C:/backup on Windows
# and /opt/backup on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"

# backup dependencies/components
# dependency "somedep"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
