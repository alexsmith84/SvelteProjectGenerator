#!/bin/sh

# Creates a new svelte app with typescript
# In addition, it also installs svelte-check CLI, git and initializes itself.

# Usage:
# create-typescript-svelte-app [NAME]
# If a project name isn't provided, defaults to "svelte-typescript-app"

# NOTE: Assumes npx is installed.

PROJECT_NAME_DEFAULT="svelte-typescript-app"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo "Script directory: $SCRIPT_DIR"

if [[ -n "$1" ]]
then
    NAME=$1
    echo "Creating typescript svelte app named: $NAME"
else
    NAME=$PROJECT_NAME_DEFAULT
    echo "No project name provided."
    echo "Creating a Svelte App with TypeScript support named: $NAME"
fi

npx degit sveltejs/template $NAME
cd $NAME
node scripts/setupTypeScript.js
npm install

# Install CLI: svelte-check
npm i svelte-check --save-dev

# Initialize a git repostory
git init

git config user.email "alex.smith.93@gmail.com"
git config user.name "Alex Smith"

# Don't automatically add CRLF to line endings on windows. Let VS Code interpret for us.
git config core.autocrlf false

# Create an updated gitignore file
$SCRIPT_DIR/generate_gitignore_file.sh

# Make first GIT commit
git add .
git commit -m "Project Genesis: A Svelte App with TypeScript support"

# Output modules that are installed.
echo "Installed modules:"
$SCRIPT_DIR/is_installed.sh