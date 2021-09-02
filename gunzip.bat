<#  :cmd header for PowerShell script
@   set dir=%~dp0
@   set ps1="%TMP%\%~n0-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.ps1"
@   copy /b /y "%~f0" %ps1% >nul
@   powershell -NoProfile -ExecutionPolicy Bypass -File %ps1% %*
@   del /f %ps1%
@   goto :eof
#>
$progressPreference = 'silentlyContinue' 


if($Args.count -lt 1){
 echo "gunzip - emulates the minimal linux gunzip functionality"
 echo "Example: gunzip <file to unzip> <output file>"
 exit
}

Function DeGZip-File{
    Param(
        $infile,
        $outfile = ($infile -replace '\.gz$','')
        )
    $input = New-Object System.IO.FileStream $inFile, ([IO.FileMode]::Open), ([IO.FileAccess]::Read), ([IO.FileShare]::Read)
    $output = New-Object System.IO.FileStream $outFile, ([IO.FileMode]::Create), ([IO.FileAccess]::Write), ([IO.FileShare]::None)
    $gzipStream = New-Object System.IO.Compression.GzipStream $input, ([IO.Compression.CompressionMode]::Decompress)
    $buffer = New-Object byte[](1024)
    while($true){
        $read = $gzipstream.Read($buffer, 0, 1024)
        if ($read -le 0){break}
        $output.Write($buffer, 0, $read)
        }
    $gzipStream.Close()
    $output.Close()
    $input.Close()
}



DeGZip-File $Args[0] $Args[1]
