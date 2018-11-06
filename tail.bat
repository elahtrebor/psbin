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
 echo "emulates linux tail"
 echo "Incorrect arguments detected. Please use tail <COUNT>"
 echo "example: cat test.txt|tail -10"
 exit
}

$Args[0] = $Args[0] -replace "-", ""
 
foreach ($line in $input|select -Last $Args[0]){
 echo $line
}