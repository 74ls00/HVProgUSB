@echo off
chcp 1251
cls
set proname=HWProgUSB
set propath=G:\home\Documents\Projects\0-Electronics\Programmer\eagle\HVProg
set outpath=%propath%\backup


set now=%DATE: =0% %TIME: =0%
for /f "tokens=1-7 delims=/-:., " %%a in ( "%now%" ) do (
rem    %%a - год %%b - мес€ц %%c - день %%d - часы %%e - минуты %%f - секунды %%g - сотые
rem	set now=%%a%%b%%c%%d%%e
rem »Ћ» %%c - год %%b - мес€ц %%a - день %%d - часы %%e - минуты %%f - секунды %%g - сотые
rem set now=%%c%%b%%a_%%d%%e
set now=%%a%%b%%c_%%d%%e
)

set outfile=%outpath%\%proname%_%now%.7z
set bin7z="%ProgramFiles%\7-Zip\7z.exe"
rem set listtxt=%propath%\help\packHWProgPro7z.txt

set listtxt=%~d0%~p0packHWProgPro7z.txt

set incl=backup
set incl2=hwprog
set incl3=dude
set incl4=set
set incl5=pic
set incl6=local
set incl7=uploads
set incl8=programmer_dip
set incl9=mod.txt


rem pause

%bin7z% a -t7z -mx8 -m0=lzma2 -mmt=8 -ssw -scsWIN -r0 -x@%listtxt% %outfile% %propath% -xr!%incl% -xr!%incl2% -xr!%incl3% -xr!%incl4% -xr!%incl5% -xr!%incl6% -xr!%incl7% -xr!%incl8% -xr!%incl9%




rem %bin7z% a -tzip %outfile% %propath%\eagle.epf %propath%\HWProgUSB.sch %propath%\HWProgUSB.brd %propath%\ExportGerber.cam %propath%\DesignRules.dru %propath%\adapters\ %propath%\gerber\ %propath%\info\ %propath%\sprint\src\ %propath%\sprint\build_au3.bat %propath%\sprint\GerberAImport4SL6.au3 %propath%\sprint\GerberAImport4SL6.exe %propath%\sprint\import.ini %propath%\sprint\PCB.lay6 %propath%\mega8pin.sch %propath%\mega8pin.png %propath%\EHWProgUSB.sch.png %propath%\EHWProgUSB.brd.png

