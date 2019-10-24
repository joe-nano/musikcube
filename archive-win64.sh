#!/bin64/sh

VERSION=$1

if [ -z "$VERSION" ]; then
  echo "usage: ./archive-win32.sh <version>"
  exit
fi

VANILLA="bin64/dist/musikcube_win32_$VERSION"
MILKDROP="bin64/dist/musikcube_win32_with_milkdrop2_$VERSION"

rm -rf "$VANILLA"
rm -rf "$MILKDROP"

mkdir -p "$VANILLA/plugins"
mkdir -p "$VANILLA/themes"
mkdir -p "$VANILLA/locales"
mkdir -p "$VANILLA/fonts"
cp bin64/release/musikcube.exe "$VANILLA" 
cp bin64/release/*.dll "$VANILLA" 
cp bin64/release/plugins/*.dll "$VANILLA/plugins"
cp bin64/release/themes/*.json "$VANILLA/themes"
cp bin64/release/locales/*.json "$VANILLA/locales"
cp bin64/release/fonts/*.ttf "$VANILLA/fonts"
rm "$VANILLA/plugins/vis_milk2.dll"
pushd $VANILLA
7z a -tzip "musikcube_win32_$VERSION.zip" ./* -mx=9
mv "musikcube_win32_$VERSION.zip" ..
popd

mkdir -p "$MILKDROP/plugins"
mkdir -p "$MILKDROP/themes"
mkdir -p "$MILKDROP/locales"
mkdir -p "$MILKDROP/fonts"
cp bin64/release/musikcube.exe "$MILKDROP"
cp bin64/release/*.dll "$MILKDROP" 
cp bin64/release/plugins/*.dll "$MILKDROP/plugins"
cp bin64/release/themes/*.json "$MILKDROP/themes"
cp bin64/release/locales/*.json "$MILKDROP/locales"
cp bin64/release/fonts/*.ttf "$MILKDROP/fonts"
cp -rfp bin64/release/plugins/Milkdrop2 "$MILKDROP/plugins"
pushd $MILKDROP
7z a -tzip "musikcube_win32_with_milkdrop2_$VERSION.zip" ./* -mx=9
mv "musikcube_win32_with_milkdrop2_$VERSION.zip" ..
popd