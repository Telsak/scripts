# This is a bash script to generate qrcodes by reading a text string
# from a file and adding a human readable text part below the qr code
#!/bin/bash
echo "=================================="

while read p; do
    if echo "$p" | grep '*\|\/'; then
      echo "Illegal entry in hosts.txt file"
      break
    else
      qrencode -s 5 -i $p -o $p-QR.png
      convert $p-QR.png -pointsize 24 label:"$p" -gravity center -append $p.png
    #rm $p-QR.png
      echo $p-QR.png
    fi
done < $1
#mv *.png /mnt/storage/downloads/fromPC/
