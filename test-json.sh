#!/bin/bash
#
# brew install jsonlint
# npm install jsonlint -g
# npm install ajv -g
# npm install ajv-cli -g
#
# make sure all of the files are well-formed JSON
find ./rsrc-schema/tst ./rsrc-schema/src -type f -name '*.json' -exec jsonlint --quiet --compact {} \;
