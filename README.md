This repo was for the old Debian based version of SteamOS which doesn't exist anymore. It is therefore archived.

# SteamOS container builder
This is a collection of scripts made for building SteamOS docker containers.

The SteamOS container build with this is also available from the dockerhub. You can download it with:
```
docker pull sharkwouter/steamos
```

 ### Dependencies
 The following software is required to build the container:
  - docker
  - realpath
  - debootstrap

 ### Building
 Just run start the setup-chroot.sh script with:

 ```
 sudo ./setup-chroot.sh
 ```
