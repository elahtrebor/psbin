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

if($Args[0] -match '-h' -Or $($args.Count) -lt 1 ){
 echo "which - Emulates a minimal linux which. Find where executables live."
 echo "use which <FILENAME>"
 exit
}

$winpath = $(dir env:path).value
$paths = $winpath.split(';')

foreach ($dir in $paths){
 if (test-path -path "$dir\$Args.bat"){
  echo "$dir\$Args"
 }
 if (test-path -path "$dir\$Args.exe"){
  echo "$dir\$Args"
 }


}


 
