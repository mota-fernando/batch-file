@ECHO ON
DIR /A-D /B >> D:\_TEMP\prints-1600p\list.txt
for  /R %%f in (*) do (
cd D:\_TEMP\prints-1600p
D:
set /p val=<%%f
MKDIR "%%~nf"
cd ..
START scalc.exe  --norestore --view "%%f"
@choice /T 10 /C y /CS /D y
START D:\_TEMP\nircmd.exe savescreenshot D:/_TEMP/prints-1600p/"%%~nf"/"%%~nf".png
@choice /T 2 /C y /CS /D y
taskkill /F /IM  scalc.exe
taskkill /F /IM  soffice.exe
taskkill /F /IM  soffice.bin
)
PAUSE
EXIT