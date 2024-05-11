set DP=%1
if not ""%DP%=="" goto NEXT
set /P DP="Enter the path:"
:NEXT

set CUR_DIR=%TEMP%

set _WK=%TIME::=%
set _WK=%_WK:.=%
set _WK=%_WK: =0%

set LOG=%CUR_DIR%\log%_WK%_%RANDOM%.txt
set LIST=%CUR_DIR%\list%_WK%_%RANDOM%.txt

COPY NUL %LOG%
echo File	Suffix	Permissions	Size	ModDate	Directory	FullPath >> %LOG%
COPY NUL %LIST%

dir /S /B "%DP%" >> %LIST%

for /F "delims=	" %%I in ( %LIST% ) DO @echo %%~nxI	%%~xI	%%~aI	%%~zI	%%~tI	%%~pI	%%~fI>> %LOG%

notepad %LOG%

del %LOG%
del %LIST%
exit 0
