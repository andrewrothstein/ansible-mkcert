#!/usr/bin/env sh
set -e
readonly GHUSER=FiloSottile
readonly APP=mkcert
DIR=~/Downloads
readonly MIRROR=https://github.com/${GHUSER}/${APP}/releases/download

dl() {
    local ver=$1
    local os=$2
    local arch=$3
    local dotexe=${4:-}

    local platform="${os}-${arch}"
    local file="${APP}-${ver}-${platform}${dotexe}"
    local lfile=$DIR/$file

    # https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-darwin-amd64
    local url="$MIRROR/$ver/$file"

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1

    printf "  %s:\n" $ver

    dl $ver darwin amd64
    dl $ver darwin arm64
    dl $ver linux amd64
    dl $ver linux arm
    dl $ver linux arm64
    dl $ver windows amd64 .exe
    dl $ver windows arm64 .exe
}

dl_ver ${1:-v1.4.4}
