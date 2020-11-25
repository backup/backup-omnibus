# frozen_string_literal: true

name 'backup'
license 'MIT'
default_version ENV.fetch('BACKUP_VERSION', '5.0.0.beta.3')

source github: 'backup/backup'
relative_path 'backup'

dependency 'libxml2'
dependency 'bzip2'
dependency 'curl'

dependency 'ruby'
dependency 'rubygems'
dependency 'bundler'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "git checkout #{version}", env: env
  bundle 'install --without development', env: env
  gem "build backup.gemspec -o backup-#{version}.gem"
  gem "install backup-#{version}.gem" \
      " --bindir '#{install_dir}/bin'" \
      ' --no-document', env: env

  # gem "install backup" \
  #     " --version '#{version}'" \
  #     " --bindir '#{install_dir}/bin'" \
  #     " --no-document", env: env
end
