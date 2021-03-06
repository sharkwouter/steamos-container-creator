#!/bin/bash
target="brewmaster"
dockerfile="Dockerfile"
workdir="$(realpath $0|rev|cut -d '/' -f2-|rev)"
keyring="${workdir}/chroot-files/valve-archive-keyring.gpg"
script="${workdir}/chroot-files/brewmaster"

# Make sure we are running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Make sure we're working in the directory of this script
cd ${workdir}

# Create a new directory for the chroot
rm -rf ${target}
mkdir -p ${target}

# Generate the chroot
debootstrap --keyring="${keyring}" --arch amd64 brewmaster ${target} http://repo.steampowered.com/steamos/ ${script}

# Copy files to the chroot
cp ${workdir}/chroot-files/copy/* ${target}/

# Create base docker image
tar -C ${target} -c . | docker import - ${target}-base

#Build the docker container
docker build -f ${workdir}/${dockerfile} -t brewmaster ${workdir}
