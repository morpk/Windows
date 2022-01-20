$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"

Start-Transcript -path C:\temp\PrimoErrorLog.txt -append




$PrimoFolder = "C:\Primo"
$PrimoFolderContent = $PrimoFolder + "\*"
$itemType = "Directory"
$writeEmptyLine = "`n"
$writeSeperator = " - "
$time = Get-Date
$foregroundColor1 = "Yellow"
$foregroundColor2 = "Red"

$PrimoTempFolder = "C:\temp\Primo"
$PrimoTempFolderContent = $PrimoFolder + "\*"
$itemType = "Directory"
$writeEmptyLine = "`n"
$writeSeperator = " - "
$time = Get-Date
$foregroundColor1 = "Yellow"
$foregroundColor2 = "Red"

If (!(Test-Path -Path $PrimoFolder)){New-Item -ItemType $itemType -Force -Path $PrimoFolder
    Write-Host ($writeEmptyLine + "# Primo folder created" + $writeSeperator + $time)`
    -foregroundcolor $foregroundColor1 $writeEmptyLine
 }Else{Write-Host ($writeEmptyLine + "# Primo folder already exists Continue Script" + $writeSeperator + $time)`
    -foregroundcolor $foregroundColor2 $writeEmptyLine}


If (!(Test-Path -Path $PrimoTempFolder)){New-Item -ItemType $itemType -Force -Path $PrimoTempFolder
    Write-Host ($writeEmptyLine + "# Primo Temp folder created" + $writeSeperator + $time)`
    -foregroundcolor $foregroundColor1 $writeEmptyLine
 }Else{Write-Host ($writeEmptyLine + "# Primo temp folder already exists Continue Script" + $writeSeperator + $time)`
    -foregroundcolor $foregroundColor2 $writeEmptyLine}


robocopy "\\spc-apps\company\primo\" "c:\temp\primo" 
Start-Process -FilePath "C:\temp\Primo\Update Tharstern.cmd"   

Stop-Transcript