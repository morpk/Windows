#Copy BP Update to all computers

# Path for the workdir
$tempfolder = "C:\MSP\BP\Update"

# Check if Temp directory exists if not create it

If (Test-Path -Path $tempfolder -PathType Container)
{ Write-Host "$tempfolder already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $tempfolder  -ItemType directory }

Remove-Item $tempfolder\* -Force

#Copy Files from Server to Temp Folder on Computer
robocopy "\\HMS-DC\Data$\MSP\Programs\Best Practice\Saffron SP2 Update" $tempfolder


Start-Process $tempfolder\BP_1.11.2.952.exe -ArgumentList /s