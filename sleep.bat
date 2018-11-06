<#  :cmd header for PowerShell script
@   set dir=%~dp0
@   set ps1="%TMP%\%~n0-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.ps1"
@   copy /b /y "%~f0" %ps1% >nul
@   powershell -NoProfile -ExecutionPolicy Bypass -File %ps1% %*
@   del /f %ps1%
@   goto :eof
#>
$progressPreference = 'silentlyContinue'
if ( $Args.count -lt 1 -or $Args[0] -match '-h') {
 echo "emulates minimal linux sleep in seconds"
 echo "usage: sleep <NUM_SECONDS>"
 echo "example: sleep 5"
 exit
}


Start-Sleep -seconds $Args[0] 