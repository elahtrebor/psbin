<#  :cmd header for PowerShell script
@   set dir=%~dp0
@   set ps1="%TMP%\%~n0-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.ps1"
@   copy /b /y "%~f0" %ps1% >nul
@   powershell -NoProfile -ExecutionPolicy Bypass -File %ps1% %*
@   del /f %ps1%
@   goto :eof
#>
$progressPreference = 'silentlyContinue' 
if ( $Args.count -lt 1 ) {
 echo "emulates linux curl"
 echo "Incorrect arguments detected. Please use curl <URL>"
 echo "example: curl http://yourUrlHere.com"
 exit
} 
$webResponse = Invoke-WebRequest $Args[0]
$webResponse.RawContent
