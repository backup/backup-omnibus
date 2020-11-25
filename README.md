backup Omnibus project
======================
This project creates full-stack platform-specific packages for
`backup`!

At the moment, only the debian build are tested, and supported. Help to support other systems is welcomed !

Installation
------------
You must have a sane Ruby 2.0.0+ environment with Bundler installed. Ensure all
the required gems are installed:

```shell
$ bundle install --binstubs
```

Usage
-----
### Build in Docker

We provide a script to run the debian build in Docker to get a clean build env
everytime. This script caches stuff in the `cache/` folder and outputs pkgs in
the `pkg/` folder. The omnibus build is a bit brittle, so you might have to run
it a few time

``` shell
$ ./build.sh BACKUP_GIT_REF BUILD_NUMBER
```

For example, you might want to build version 5.0.0.beta.3 and it's your third build:


``` shell
$ ./build.sh 5.0.0.beta.3 3
```


### Build

You create a platform-specific package using the `build project` command:

```shell
$ bin/omnibus build backup
```

The platform/architecture type of the package created will match the platform
where the `build project` command is invoked. For example, running this command
on a MacBook Pro will generate a Mac OS X package. After the build completes
packages will be available in the `pkg/` folder.

### Clean

You can clean up all temporary files generated during the build process with
the `clean` command:

```shell
$ bin/omnibus clean backup
```

Adding the `--purge` purge option removes __ALL__ files generated during the
build including the project install directory (`/opt/backup`) and
the package cache directory (`/var/cache/omnibus/pkg`):

```shell
$ bin/omnibus clean backup --purge
```

If you're using the build in docker feature, you can just remove the `cache/` folder

### Help

Full help for the Omnibus command line interface can be accessed with the
`help` command:

```shell
$ bin/omnibus help
```

Version Manifest
----------------

Git-based software definitions may specify branches as their
default_version. In this case, the exact git revision to use will be
determined at build-time unless a project override (see below) or
external version manifest is used.  To generate a version manifest use
the `omnibus manifest` command:

```
omnibus manifest PROJECT -l warn
```

This will output a JSON-formatted manifest containing the resolved
version of every software definition.
