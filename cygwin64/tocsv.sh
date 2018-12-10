#!/bin/zsh
if [[ "$#" -eq 0 ]] {
  echo "usage: './tocsv.sh <files>";
  exit 1;
}

for file_name in $*;
do
  if [[ ! ${file_name} =~ '\.xml$' ]] {
    echo "  WARNING: ${file_name}: this script only handles xml files";
  } else {
    output_file=${file_name//.xml/.csv};
    xsltproc --output "${output_file}" tocsv.xsl "${file_name}";
    echo "processed: ${file_name}";
  }
done
