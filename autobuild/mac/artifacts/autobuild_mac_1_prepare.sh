#!/bin/sh -e

# autobuild_1_prepare: set up environment, install Qt & dependencies

if [ "$#" -ne "1" ]; then
    echo "need to specify Qt version"
    exit 1
fi

QT_VER=$1

###################
###  PROCEDURE  ###
###################

echo "Install dependencies..."
python3 -m pip install aqtinstall
python3 -m aqt install-qt --outputdir /usr/local/opt/qt mac desktop ${QT_VER}

# add the qt binaries to the path
export -p PATH=/usr/local/opt/qt/${QT_VER}/clang_64/bin:"${PATH}"
echo "::set-env name=PATH::${PATH}"
echo "the path is ${PATH}"

