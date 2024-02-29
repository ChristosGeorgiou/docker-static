#!/bin/bash

VERSION=$(npm version minor --force)
echo "Releasing $VERSION"
git push --follow-tags
gh release create $VERSION --generate-notes
