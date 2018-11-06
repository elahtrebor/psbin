<#  :cmd header for PowerShell script
@   set dir=%~dp0
@   set ps1="%TMP%\%~n0-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.ps1"
@   copy /b /y "%~f0" %ps1% >nul
@   powershell -NoProfile -ExecutionPolicy Bypass -File %ps1% %*
@   del /f %ps1%
@   goto :eof
#>
$progressPreference = 'silentlyContinue'


function help1 {
 echo "emulates the minimal linux awk functionality of '{print `$1 `$2 `$3 }'"
 echo "Please use awk -F, ""`{print `$1 `$2 `$3 `}"""
 echo "example: cat test.txt|awk "","" 1 2 3"
 echo "Note: Windows must use Double Quote.."
 exit
}

# check for argument count
if ( $Args.count -lt 1 ) {
 help1
}

$delim = " "
$expr = ""

# parse for flag

 if($Args[0] -match '-'){
   if($Args[0] -notmatch "F"){
      help1     
    }
} 


if($Args[0] -match "-F"){
$Args[0]  = $Args[0] -replace "-F", ""
$expr = $Args[1]
$delim = $Args[0]
}
 else 
{
 $expr = $Args[0]
}

$expr = $expr -replace "{", ""
$expr = $expr -replace "}", ""
$exprArr = $expr -split " "


foreach ($line in $input){
  $arr = $line -split $delim 
  foreach ($n in $exprArr){
     if($n -match "print"){} 
       else {
       $n = $n -replace "\$", ""
       write-host -nonewline "$($arr[$n - 1]) "
      } 
   }
 echo ""
 

}

