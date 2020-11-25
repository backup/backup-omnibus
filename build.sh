#!/usr/bin/env bash

set -x

omnibus_backup_dir=$(realpath $(dirname "$0"))
backup_version=$1
backup_build=$2

function print_usage() {
    echo "build.sh backup_version build_number"
    echo "backup_version should be a git tag"
}

if [ -z "${backup_version}" ]; then
    echo "missing backup version"
    print_usage
    exit 1
fi

sudo chmod -R +r ${omnibus_backup_dir}/cache

(cd ${omnibus_backup_dir} \
     && docker build -t omnibus-backup . \
     && docker run -ti --rm --name omnibus-backup \
               -e BACKUP_VERSION=${backup_version} \
               -e BACKUP_BUILD=${backup_build} \
               -v ${omnibus_backup_dir}/pkg:/omnibus-backup/pkg \
               -v ${omnibus_backup_dir}/cache:/var/cache/omnibus \
               omnibus-backup \
)
