
# Download velociraptor client windows MSI 
(New-Object System.Net.WebClient).DownloadFile('https://github.com/iknowjason/BlueTools/blob/main/velociraptor-v0.5.0-1-windows-amd64.msi.zip?raw=true', 'C:\terraform\velociraptor-windows-msi.zip')

# Expand the Sysmon zip archive
Expand-Archive -LiteralPath 'C:\terraform\velociraptor-windows-msi.zip' -DestinationPath 'C:\terraform\velociraptor-windows-msi'

# Install the velociraptor MSI with quiet mode 
msiexec.exe /I C:\terraform\velociraptor-windows-msi\velociraptor-v0.5.0-1-windows-amd64.msi /quiet

# Copy the velociraptor client config 
#Copy-Item "C:\terraform\client.config.yaml" -Destination "C:\Program Files\Velociraptor\Velociraptor.config.yaml"
