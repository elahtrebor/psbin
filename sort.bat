<#  :cmd header for PowerShell script
@   set dir=%~dp0
@   set ps1="%TMP%\%~n0-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.ps1"
@   copy /b /y "%~f0" %ps1% >nul
@   powershell -NoProfile -ExecutionPolicy Bypass -File %ps1% %*
@   del /f %ps1%
@   goto :eof
#>
$progressPreference = 'silentlyContinue'

if($Args[0] -match '-h'){
 echo "sort - Emulates a minimal linux sort."
 echo "use sort <FLAG>"
 echo "Where flag is:"
 echo "-r        reverse"
 echo "-u        unique"
 echo "-h        help"
 exit
}


if ($Args[0] -match '-r'){
 $input |sort -des
 exit
}

if ($Args[0] -match '-u'){
 $input|sort -unique
 exit
}

$input|sort
