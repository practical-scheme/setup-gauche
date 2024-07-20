#!/bin/bash

# download-and-install-gauche.sh VERSION TEST CONFIG-OPTS BINARY
#
#  If BINARY is true, we fetch a prebuilt binary.  It's a lot quicker,
#  but available only for limited platforms and versions.

# Constants
get_gauche_url="https://raw.githubusercontent.com/practical-scheme/get-gauche/master/get-gauche.sh"
binary_url="https://github.com/practical-scheme/setup-gauche-binary/releases/download/v1"

# Arguments
version=$1
do_test=$2
configure_opts=$3
binary=$4

opts='--sudo --auto'

if [ -z "$version" ]; then
    version=latest
fi
opts="$opts --version=$version"

case `uname` in
    Darwin)
        prefix=/usr/local;;
    *)
        prefix=/usr;;
esac
opts="$opts --prefix=$prefix"

if [ "$do_test" != 'true' ]; then
    opts="$opts --skip-tests"
fi

if [ ! -z "$configure_opts" ]; then
    opts="$opts --configure-args='$configure_opts'"
fi

if [ "$binary" = 'true' ]; then
    if [ "$version" != 'latest' -o "$do_test" != 'false' -o -n "$configure_opts" ]; then
        echo "If prebuilt-binary is true, no other option should be given."
        exit 1
    fi

    platform=`uname -s`
    case "$platform" in
        Linux)
            binary_tarball=gauche-binary-ubuntu-latest.tar.gz ;;
        Darwin)
            binary_tarball=gauche-binary-macos-latest.tar.gz ;;
        *)
            echo "Prebuilt binary is not available on this platform: $platform"
            exit 1 ;;
    esac
    echo "Instaling $binary_url/$binary_tarball"
    curl -L -f -o $binary_tarball $binary_url/$binary_tarball
    mkdir package
    (cd package; tar xzvf ../$binary_tarball)
    (cd package; sudo cp -r . /)
else
    curl -f -o get-gauche.sh $get_gauche_url
    chmod +x get-gauche.sh

    echo "Running get-gauche.sh $opts"
    echo ./get-gauche.sh $opts | /bin/bash
fi
