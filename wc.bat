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
 echo "wc - Emulates a minimal linux wc (word count)."
 echo "use wc <FLAG>"
 echo "Where flag is:"
 echo "-l        lines"
 echo "-c        characters"
 echo "-h        help"
 exit
}

$lf = 0
$cf = 0

if($Args[0] -eq '-l'){
 $lf = 1;
}

if($Args[0] -eq '-c'){
 $cf = 1
}

$count = 0;
foreach ($i in $input){
 if($lf -eq 1){
  $count = $count + 1;
 }
 if($cf -eq 1){
   $count = $count + $i.length
 } 
}
echo $count
