# This is a bash script to check ssh services on hosts
#!/bin/bash

echo "=================================="

# First we remove the old output file
rm results.txt

# While loop reads in the contents of a file ($1 which is argument to script)
# and then uses the IP adress which is 1 per line to check ssh status
# the line/IP is stored in variable $p
while read p; do

    # nc is 'netcat' which attempts to write or test a network address and port
    # we also add in a delay of 3 seconds (-w3) which avoid us being stuck
    # for a long time on each ssh-check
    nc -znv -w3 $p 22

    # the if checks the exit status (or program result which is a 'hidden'
    # message returned by a program to the shell to indicate if the program
    # ended sucessfully or not.
    # If the exit status equals 1, then we have no connection.
    # If the exit status equals 0, then we have a working connection.
    if [ $? -ne 0 ]
	then

      # This writes the message to the screen AND appends it to the end of a textfile.
	  echo "No connection" | tee -a results.txt
  	else
      echo "OK" | tee -a results.txt
    fi	  
done < $1
