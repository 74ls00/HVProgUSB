
chcp 1251
cls

avrdude -p 8535 -P COM14 -c pl2303 -B 4800 -i 500  -F

rem pause