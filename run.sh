#!/bin/bash
[ $# -eq 0 ] && { echo "Usage: bash $0 <asciidoc file>"; exit 1; }

path="$(realpath $1)"

fullname="${path##*/}"
dirname="${path%/*}"

# If the file is in the same directory with the script,
# path likely will not include any directory separator.
if [ "$dirname" == "$path" ]; then
  dirname="."
fi

rm -Rf ${dirname}/dist
mvn clean generate-resources -Dasciidoctor.sourceDocumentName=${fullname} -Dasciidoctor.sourceDirectory=${dirname} -Dasciidoctor.outputDirectory=${dirname}/dist -Dasciidoctor.outputFile=${dirname}/dist/example.pdf
