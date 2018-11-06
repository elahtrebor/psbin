<#  :cmd header for PowerShell script
@   set dir=%~dp0
@   set ps1="%TMP%\%~n0-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.ps1"
@   copy /b /y "%~f0" %ps1% >nul
@   powershell -NoProfile -ExecutionPolicy Bypass -File %ps1% %*
@   del /f %ps1%
@   goto :eof
#>
$progressPreference = 'silentlyContinue'

function grephelp{
 echo "emulates linux grep"
 echo "use: grep <REGEX> | <FLAG> <REGEX>"
 echo "Where flag is:"
 echo "-i        case insensitive"
 echo "-v        negate match"
 echo "-h        help"
exit
}

if ( $Args.count -lt 1 ) {
 grephelp
}

$i = 0
$v = 0

if($Args[0] -match '-'){
# process switch
 if($Args[0] -match 'i'){ $i = 1; }
 if($Args[0] -match 'v'){ $v = 1; }
 if($Args[0] -match 'h'){ grephelp }

}

function grep1($pat, $_){
 foreach ($line in $_){
   if($line -match $pat) { echo $line } 
   }
}

 $pat = ""
 if($Args[0] -notmatch "^\-"){
  $pat = $Args[0]
  grep1 $pat $input
  exit
 }

 if($Args[0] -match "^\-"){

  foreach ($line in $input){
   $match = 0
   if($line -match $Args[1]) { 
   $match++ }

   if($i -eq 1) { 
    if($line -imatch $Args[1]) { $match++ }
   } 
 
   if($v -eq 1) { 
     if ($match -gt 0) { $match = 0 } 
      else { $match = 1 }
   }
 
   if($match -ne 0 ) { echo $line}  
 }

}
