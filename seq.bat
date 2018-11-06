<#  :cmd header for PowerShell script
@   set dir=%~dp0
@   set ps1="%TMP%\%~n0-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.ps1"
@   copy /b /y "%~f0" %ps1% >nul
@   powershell -NoProfile -ExecutionPolicy Bypass -File %ps1% %*
@   del /f %ps1%
@   goto :eof
#>
$progressPreference = 'silentlyContinue' 

if($Args.count -lt 2) {
 echo "Minimal linux version of seq (sequence)"
 echo "Incorrect Arguments detected. Please use seq <NUM_START> <NUM_END>"
 echo "Example: seq 1 10"
 exit
}

$Args[0]..$Args[1]
