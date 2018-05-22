name "backup"

dependency "ruby"

build do

  env = with_standard_compiler_flags(with_embedded_path)

  gem "install #{name}", :env => env

end
