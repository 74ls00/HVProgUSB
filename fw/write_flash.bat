title write flash
pause
pause
avrdude -p 8535 -P com7 -c pl2303 -B 4800 -i 400  -U flash:w:"STK500.hex":a
pause