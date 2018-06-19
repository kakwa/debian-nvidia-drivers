# Name of the package
NAME = nvidia-graphics-drivers

# Version
VERSION = 390.67

# Revision number 
RELEASE = 1

# URL of the project 
URL=http://example.org/stuff

# short summary of what the package provides
SUMMARY=Not a package summary

# Long version of the summary, but I'm lazy
DESCRIPTION=$(SUMMARY)

# License of the upstream project
LICENSE=Upstream License

# Distribution versions to skip
#
# format: space separated list of rules.
# each rule have the format "<op>:<dist>:<version>", with:
#   <op>:      the operation (must be  '>', '>=', '<', '<=' or '=')
#   <dist>:    the distribution code name (examples: 'deb', 'el', 'fc')
#   <version>: the version number to ignore
#
#SKIP=<=:deb:8 <=:el:6 <=:fc:29 <=:ubu:18.4

###############################################################################
# Rule #
########

# example of source recovery url
URL_SRC_amd64=http://us.download.nvidia.com/XFree86/Linux-x86_64/390.67/NVIDIA-Linux-x86_64-390.67.run
URL_SRC_i386=http://us.download.nvidia.com/XFree86/Linux-x86/390.67/NVIDIA-Linux-x86-390.67.run
URL_SRC_armv7=http://us.download.nvidia.com/XFree86/Linux-x86-ARM/390.67/NVIDIA-Linux-armv7l-gnueabihf-390.67.run

# Including common rules and targets 
include buildenv/Makefile.common

# preparation hook for sources
# source archive must be recovered here, optionaly reworked, and
# moved to $(SOURCE_ARCHIVE) (the expected path of the source archive for the
# rest of the build)
#
# $(WGS) should be the prefered way to recover archives
# (add checksum against a manifest file).
# use 'make manifest' to generate/update this manifest file.

# Example of simple recovery, with good upstream
#$(SOURCE_ARCHIVE): $(SOURCE_DIR) $(CACHE) Makefile MANIFEST
#	$(WGS) -u $(URL_SRC) -o $(SOURCE_ARCHIVE)

# more complex case with upstream source rework and rebuilding of the tar
$(SOURCE_ARCHIVE): $(SOURCE_DIR) $(CACHE) Makefile MANIFEST
	mkdir -p $(SOURCE_DIR)/amd64
	mkdir -p $(SOURCE_DIR)/i386
	mkdir -p $(SOURCE_DIR)/armhf
	$(WGS) -u $(URL_SRC_amd64) -o $(SOURCE_DIR)/amd64/NVIDIA-Linux-x86_64-390.67.run
	$(WGS) -u $(URL_SRC_i386) -o $(SOURCE_DIR)/i386/NVIDIA-Linux-x86-390.67.run
	$(WGS) -u $(URL_SRC_armv7) -o $(SOURCE_DIR)/armhf/NVIDIA-Linux-armv7l-gnueabihf-390.67.run
	$(SOURCE_TAR_CMD)
