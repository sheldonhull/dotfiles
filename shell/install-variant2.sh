#!/usr/bin/env bash
# REF: Tag constraint patterns: https://github.com/gruntwork-io/fetch#tag-constraint-expressions
# USES FETCH TO SIMPLIFY: https://github.com/gruntwork-io/fetch

USER=mumoshu
REPO=variant2
TAG=0.33.0
BINARY=variant

echo "Running $(fetch --version) to grab $USER/$REPO"
mkdir tmp
chmod +r tmp
fetch --repo="https://github.com/mumoshu/variant2" --tag="~>$TAG" --release-asset="variant_.*_linux_amd64.tar.gz" --progress ./tmp
DOWNLOADED_FILE=$(find ./tmp/*.gz)
EXTRACTED=$(tar -C ./tmp  -xvzf $DOWNLOADED_FILE variant)
echo "Extracted $EXTRACTED successfully"
echo "Moving to /usr/bin/local and setting as executable"
chmod +x ./tmp/$EXTRACTED
sudo mv ./tmp/$EXTRACTED /usr/local/bin
rm -r ./tmp
