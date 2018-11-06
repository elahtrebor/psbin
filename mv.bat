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
 echo "mv - Emulates a minimal linux mv (Move)."
 echo "use mv <SOURCE> <DESTINATION>"
 echo "-h        help"
 exit
}

mv $Args[0] $Args[1]
