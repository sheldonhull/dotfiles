#!/usr/bin/env bash

echo "Grabbing latest release of fetch (a github cli for release downloads)"
USER=gruntwork-io
REPO=fetch
TAG=latest
ASSET=fetch_linux_amd64
FILE=fetch
curl --silent "https://api.github.com/repos/$USER/$REPO/releases/latest" \
| jq -r ".assets[] | select(.name | test(\"${ASSET}\")) | .browser_download_url" \
| wget -qi - --output-document=$FILE --progress=bar:force

echo "setting as executable and moving to /usr/local/bin"
chmod +x $FILE
sudo mv fetch /usr/local/bin
echo "Downloaded $(fetch --version) successfully"
