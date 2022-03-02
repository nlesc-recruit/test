#!/bin/bash

LATEST_TAG=\"$(curl --silent --header "Accept: application/vnd.github.v3+json" https://api.github.com/repos/nlesc-recruit/cudawrappers/releases/latest | jq .tag_name --raw-output)\"
LATEST_REF=$(curl --silent --header "Accept: application/vnd.github.v3+json"   https://api.github.com/repos/nlesc-recruit/cudawrappers/tags | jq -c ".[] | select( .name | contains($LATEST_TAG))".commit.sha --raw-output)
MY_REF=$(git submodule status external/cudawrappers/ |  awk '{print $1}')

if [ "$MY_REF" = "$LATEST_REF" ]; then
    echo "It's all good, this repo's submodule is using the most recent version of the cudawrappers library."
    exit 0
else
    echo "This repo's submodule is using an older version of the cudawrappers library."
    exit 1
fi
