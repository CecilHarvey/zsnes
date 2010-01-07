#!/bin/bash

# dist.sh
# zsnes
#
# Created by Daniel Potter on 1/7/10.

NAME="ZSNES 1.51-3"
BUILD=build/Release/
DIST=dist

set -e

if [ -d "$DIST" ] ; then
	echo "Removing existing distribution folder..."
	rm -rf "$DIST"
fi
mkdir "$DIST"
echo "Copying image into folder..."
cp -a "$BUILD/ZSNES.app" "$DIST"
cp "zsnes-back-1.51.png" "$DIST"
/Developer/Tools/SetFile -a V "$DIST/zsnes-back-1.51.png"
cp dist.DS_Store "$DIST/.DS_Store"
ln -s /Applications "$DIST"
echo -n "Creating the disk image"
hdiutil create -fs HFS+ -ov -volname "$NAME" -srcfolder dist -format UDBZ "$NAME"
