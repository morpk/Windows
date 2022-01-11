#The Following Script is used for copying the contents of a Windows 10 ISO from a Server Share
#Please Update veriable $WindowsFiles to the server path where the Windows 10 Files are located

$Windows10Upgrade = "C:\MSP\Windows10Upgrade"
$Windows10UpgradeFolderContent = $Windows10Upgrade + "\*"
$itemType = "Directory"
$foregroundColor1 = "Yellow"
$foregroundColor2 = "Red"

If (!(Test-Path -Path $Windows10Upgrade)){New-Item -ItemType $itemType -Force -Path $Windows10Upgrade
    Write-Host ($writeEmptyLine + "# Windows 10 Upgrade folder created" + $writeSeperator + $time)`
    -foregroundcolor $foregroundColor1 $writeEmptyLine
 }Else{Write-Host ($writeEmptyLine + "# Windows 10 Upgrade folder already exists" + $writeSeperator + $time)`
    -foregroundcolor $foregroundColor2 $writeEmptyLine
    Remove-Item $Windows10UpgradeFolderContent -Force -Recurse -ErrorAction SilentlyContinue
    Write-Host ($writeEmptyLine + "# Content existing Windows 10 Upgrade folder deleted" + $writeSeperator + $time)`
    -foregroundcolor $foregroundColor2 $writeEmptyLine}


###
### Copy ISO From Server to client PC
###

$WindowsFiles = "PATH TO WINDOWS FILES"
Get-ChildItem -Path $WindowsFiles
Copy-Item "$WindowsFiles\*" -Recurse -Destination $Windows10Upgrade


Start-Sleep 10
###
### start Silent Install of Windows 10
###

Start-Process $Windows10Upgrade\setup.exe -ArgumentList "/auto upgrade" "/quiet"

