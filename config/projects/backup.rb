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

#build_version Omnibus::BuildVersion.semver

# Use VERSION file to keep in sync with backup gem version.
# Do not use __FILE__ after this point, use current_file. If you use __FILE__
# after this point, any dependent defs that use instance_eval
# will fail to work correctly.
current_file ||= __FILE__
version_file = File.expand_path("../../../VERSION", current_file)
build_version IO.read(version_file).strip

build_iteration 1

override :ruby, :version => '2.3.7'

# Creates required build directories
dependency "preparation"

# backup dependencies/components
dependency "backup"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
