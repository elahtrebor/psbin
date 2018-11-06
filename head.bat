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
 echo "emulates linux head"
 echo "Incorrect arguments detected. Please use head <COUNT>"
 echo "example: cat test.txt|head -10"
 exit
}
 $Args[0] = $Args[0] -replace "-", ""

foreach ($line in $input|select -First $Args[0]){
 echo $line
}