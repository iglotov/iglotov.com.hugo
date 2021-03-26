#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add and commit changes with optional comments
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git add -A
git commit -m "$msg"

# Push built site code
git push origin master

# Commit and push site sources
cd ..
git add -A
git commit -m "$msg"
git push origin master
