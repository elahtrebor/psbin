<#  :cmd header for PowerShell script
@   set dir=%~dp0
@   set ps1="%TMP%\%~n0-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.ps1"
@   copy /b /y "%~f0" %ps1% >nul
@   powershell -NoProfile -ExecutionPolicy Bypass -File %ps1% %*
@   del /f %ps1%
@   goto :eof
#>
$progressPreference = 'silentlyContinue' 
# handle arguments

if($Args[0] -match '-h'){
 echo "wc - Emulates a minimal linux rm remove file."
 echo "use rm <FILE>"
 echo "-h        help"
 exit
}

rm $Args[0]
