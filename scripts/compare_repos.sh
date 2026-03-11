#!/bin/bash

echo "Starting repository comparison..."

REPO_B="repos/legacy-repo"

if [ ! -d "$REPO_B" ]; then
    echo "Cloning legacy repository..."
    git clone https://github.com/git/git.git $REPO_B
fi

echo ""
echo "Fetching latest changes..."
git -C $REPO_B fetch

echo ""
echo "Listing commits in legacy repo"
git -C $REPO_B log --oneline -5

echo ""
echo "Checking differences between repositories"

diff -rq export_from_legacy $REPO_B | head -20

echo ""
echo "Comparing legacy library files"

diff -rq export_from_legacy/LIBRARY_APP $REPO_B | head -20

echo ""
echo "Repository comparison completed."