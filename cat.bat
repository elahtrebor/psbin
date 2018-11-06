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
 echo "cat - Emulates a minimal linux cat (concatenate)."
 echo "use cat <FLAG> <FILENAME>"
 echo "Where flag is:"
 echo "-n        print line numbers"
 echo "-h        help"
 echo "Note this version of cat only reads."

 exit
}

$nf = 0

if($Args[0] -eq '-n'){
 $nf = 1;
}

function catinput($_){
  $x = 0
  foreach ($i in $_){
   if($nf -eq 1){ write-host -nonewline "$($x) " }
    echo $i
    $x = $x + 1
   }
}


function catfile($_) {
 $x = 0;
 foreach ($i in Get-Content $_){
 if($nf -eq 1){ write-host -nonewline "$($x) " }
 echo $i
  $x = $x + 1
 }
}

 if($Args.count -lt 1){
   catinput $input
   }

 if ($Args[0] -match '-n' -And $Args.count -lt 2) {
   catinput $input
   }


foreach ($i in $Args){
 $n = 0
 
 if($i -notmatch '-') { catfile $i }

 $n = $n + 1
}

