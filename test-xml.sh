#!/bin/bash
#
# brew install xmllint

# make sure all of the files are well-formed xml
find ./rsrc-schema/src -type f -name '*.xsd' -exec xmllint --noout {} \;
find ./rsrc-schema/tst -type f -name '*.xml' -exec xmllint --noout {} \;
