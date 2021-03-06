#!/bin/bash -ev
# Copyright (c) Facebook, Inc. and its affiliates. All Rights Reserved

# Run this script at project root by "./linter.sh" before you commit.

{
  black --version | grep -E "21.4b2" > /dev/null
} || {
  echo "Linter requires 'black==21.4b2' !"
  exit 1
}

# echo "Running isort..."
# isort -sp .

echo "Running black..."
black .

echo "Running flake8..."
if [ -x "$(command -v flake8-3)" ]; then
  flake8-3 .
else
  python3 -m flake8 fvbitcore
fi

# command -v arc > /dev/null && {
#   echo "Running arc lint ..."
#   arc lint
# }
