#!/usr/bin/env bash
# Tag the current commit
export REPO_TAG=$CURR_VER-$TRAVIS_BUILD_NUMBER
# export GITHUB_USER=DevOpsPlayground
# export GITHUB_REPO=directory-react-nodejs
# git tag $REPO_TAG $TRAVIS_COMMIT -m "Tagging $GITHUB_REPO at $REPO_TAG"
# git push --tags

# Package for deployment
rm -rf node_modules
npm install --no-optional --production
tar czvf /tmp/react-eg-$REPO_TAG.tar.gz routes assets www node_modules server.js *.json

# download the github release binary
# wget https://github.com/aktau/github-release/releases/download/v0.6.2/linux-amd64-github-release.tar.bz2
# tar xvjf linux-amd64-github-release.tar.bz2
# sleep 3

# # Create a release
# bin/linux/amd64/github-release release \
#     --user $GITHUB_USER \
#     --repo $GITHUB_REPO \
#     --tag $REPO_TAG\
#     --name "react-eg-$REPO_TAG" \

# # Publish the tar file to the repository
# bin/linux/amd64/github-release upload \
#     --user $GITHUB_USER \
#     --repo $GITHUB_REPO \
#     --tag $REPO_TAG\
#     --name "react-eg-$REPO_TAG" \
#     --file /tmp/react-eg-$REPO_TAG.tar.gz
