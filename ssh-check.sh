#!/bin/bash

echo "=================================="
rm results.txt
while read p; do
	nc -znv -w3 $p 22
	if [ $? -ne 0 ]
	then
	  echo "No connection" | tee -a results.txt
  	else
          echo "OK" | tee -a results.txt
        fi	  
done < $1
