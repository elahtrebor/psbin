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
 echo "cp - Emulates a minimal linux cp (Copy)."
 echo "use cp <SOURCE> <DESTINATION>"
 echo "-h        help"
 exit
}

cp $Args[0] $Args[1]
