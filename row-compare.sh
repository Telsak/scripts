# A bash script to help speed up taking inventory
#!/bin/bash

print_info () {
  if [ "$1" == "ARG_ERR" ]; then
    echo -e "Error: Insufficient arguments!\n"
    echo "usage: row-compare.sh [inventory-file] [scanned-items]"
  fi
}

# check so user passed enough commands
if [ "$#" -ne 2 ]; then
  print_info "ARG_ERR"
else
  rm results.txt
  while read p; do
    # grep commmand here to search the scanned item file with each item from the
    # original inventory file - thus preserving the order of items and allowing
    # us to simply paste the resulting file into the document
    # if grep exits with code 1 - ie, no match found, echo result to file
    # if grep exits with code 0 - match found or successful command - echo "JA" to file
    if [ $? -ne 0 ]
    then
      echo "no match" | tee -a results.txt
    else
      echo "JA" | tee -a results.txt
    fi
  done < $1   # the first argument from commandline is used as 
fi
