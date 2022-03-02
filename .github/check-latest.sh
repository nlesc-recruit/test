#!/bin/bash

LATEST=$(curl --header "Accept: application/vnd.github.v3+json" https://api.github.com/repos/nlesc-recruit/cudawrappers/releases/latest | jq .tag_name --raw-output)
echo $LATEST
tree
git submodule status external/cudawrappers/
cd external/cudawrappers
MY_TAGS=$(git tag --points-at HEAD)
echo $MY_TAGS
for tag in $MY_TAGS
do
    echo "Checking tag $tag..."
    if [ "$tag" = "$LATEST" ]; then
        echo "It's all good., this repo's submodule is using cudawrappers latest tag $tag."
        exit 0
    fi
done
echo "This repo's submodule is using an older version of the cudawrappers library."
exit 1
