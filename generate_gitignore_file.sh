#!/bin/sh

# Initialize gitignore file
cat > .gitignore <<- EOM
# Defaults from from Svelte and TypeScript .gitignore file.
/node_modules/
/public/build/

# Source: https://github.com/sveltejs/svelte/blob/master/.gitignore
.idea
.DS_Store
.nyc_output
.vscode
node_modules
*.map
/src/compiler/compile/internal_exports.ts
/compiler.d.ts
/compiler.*js
/index.*js
/ssr.*js
/internal
/store
/easing
/motion
/transition
/animate
/scratch/
/coverage/
/coverage.lcov
/test/*/samples/_
/yarn-error.log
_actual*.*
_output
/types
EOM
