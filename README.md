# Description 

Custom Debian packages for the nvidia propriatory drivers

# Requirements

* You need an amd64 Debian
* Install the following packages `apt-get install make debhelper reprepro cowbuilder wget`
* i386 needs to be enabled (`dpkg --add-architecture i386`)


# How to build

```bash
# replace the GPG KEY in the Makefile with yours
vim Makefile

# build for a specific DIST
make DIST=stretch
```

# How to update

* Search for the new version http://www.nvidia.com/Download/index.aspx
* Update the version in `Makefile`
* Run `make manifest`
* Update the `debian/` directory if necessary

# Aknowlegement

This packaging reuses 99% of the original Debian Packaging, it only adds a few wrapper scripts to ease building the package on various dist/arch and the final repository.

See https://github.com/kakwa/debian-nvidia-drivers/blob/master/debian/copyright for more details on copyriths.
