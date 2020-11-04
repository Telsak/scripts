# This is a bash script to check ssh services on hosts
#!/bin/bash
echo "=================================="
rm ping_results.txt

while read p; do
    ping -c 2 $p
    if [ $? -ne 0 ]
	then
      dt=$(date '+%d/%m/%Y %H:%M:%S')
      echo "$dt,$p,host is DOWN" | tee -a ping_results.txt
  	else
      echo "$dt,$p,host is UP" | tee -a ping_results.txt
    fi	  
done < $1
