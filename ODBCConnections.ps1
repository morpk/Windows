# The Below find if there is a current ODBC Connection  
# Get-OdbcDsn -Name "TharSOUPRI" -DsnType "System" -Platform "32-bit"

# The below adds an ODBC 32Bit Conneection 
 
$odbcname="TharSOUPRI"
$sqlserver="SPC-APPS\SQLXPRESS"
$sqldb="TharSoupri"
$OdbcDriver = Get-OdbcDriver -Name SQL -Platform 32-bit
 
Add-OdbcDsn -Name $odbcname -DriverName $OdbcDriver.Name -Platform 32-bit -DsnType System -SetPropertyValue @("Server=$sqlserver", "Trusted_Connection=Yes","Database=$sqldb")