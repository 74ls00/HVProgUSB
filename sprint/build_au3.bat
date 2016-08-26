chcp 1251
cls
set prodir=%~d0%~p0
set outdir=%~d0%~p0..\
set autoitdir="T:\Program Files (x86)\AutoIt3\"

set app=GerberAImport4SL6
set app86=%app%(x86)
set app64=%app%(x64)

rem tskill %app%*
taskkill /im %app%*


del %outdir%\%app86%.exe
del %outdir%\%app64%.exe

start /d %autoitdir%\Aut2Exe Aut2exe.exe /in %prodir%%app%.au3 /out %outdir%%app86%.exe /x86 /pack /icon %prodir%icon.ico
start /d %autoitdir%\Aut2Exe Aut2exe.exe /in %prodir%%app%.au3 /out %outdir%%app64%.exe /x64  /comp 4 /icon %prodir%icon.ico
