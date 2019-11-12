# A bash script to help speed up taking inventory
#!/bin/bash

print_info () {
  if [ "$1" == "TOO_FEW_ARGS" ]; then
    echo -e "Error: Insufficient arguments!\n"
    echo "usage: row-compare.sh [inventory-file] [scanned-items]"
  fi
}

# check so user passed enough commands
if [ "$#" -ne 2 ]; then
  print_info "TOO_FEW_ARGS"
else
  if [ -f results.txt ]; then
    echo "Output file exists: resetting file.."
    rm results.txt
  else
    echo "Output file missing: creating file.."
  fi
  while read p; do
    # grep commmand here to search the scanned item file with each item from the
    # original inventory file - thus preserving the order of items and allowing
    # us to simply paste the resulting file into the document
    grep $p $2
    # if grep exits with code 1 - ie, no match found, echo result to file
    # if grep exits with code 0 - match found or successful command - echo "JA" to file
    if [ $? -ne 0 ]
    then
      echo "" >> results.txt
    else
      echo "JA" >> results.txt
    fi
  done < $1   # the first argument from commandline is used as 
fi
