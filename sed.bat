<#  :cmd header for PowerShell script
@   set dir=%~dp0
@   set ps1="%TMP%\%~n0-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.ps1"
@   copy /b /y "%~f0" %ps1% >nul
@   powershell -NoProfile -ExecutionPolicy Bypass -File %ps1% %*
@   del /f %ps1%
@   goto :eof
#>
$progressPreference = 'silentlyContinue'

function help1{
 echo "emulates linux sed"
 echo "Incorrect arguments detected. Please use sed ""s/<STRING>/<REPLACEMENT_STRING>/<MODIFIER>"""
 echo "example: cat test.txt|sed ""s/[A-Za-z]/9/g"""
 echo " or Delete Line: ""<LINE_NUMBER>d"""
 echo "example: cat test.txt|sed ""10d"""
 echo "Note: Windows must use Double Quote.."
 exit
}

if ( $Args.count -lt 1 ) {
help1
}

if($Args[0] -eq '-h') {
 help1
}
# check if delete line vs replacement

 if($Args[0] -match "[0-9+]d"){
  # parse the line number
   $lnum = $Args[0]
   $lnum = $lnum -replace "d", ""
  #read the file minus the line
  $c = 1
  foreach ($line in $input){
  if($c -eq $lnum){}
   else { echo $line }
  $c++
  }
  exit  
 }

# parse the expression

$expr = $Args[0]
$exprArr = $expr -split "/"

$str = [Regex]$exprArr[1]
$rep = $exprArr[2]
$mod = $exprArr[3]

foreach ($line in $input){
 if($mod -ne "g"){
    $line =  $str.Replace($line, $rep, 1)
  } 
 else{
   $line = $line -replace $str, $rep
 }

 echo $line
}

