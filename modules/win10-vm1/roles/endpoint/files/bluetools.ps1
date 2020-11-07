# Download velociraptor client windows MSI 
(New-Object System.Net.WebClient).DownloadFile('https://github.com/iknowjason/BlueTools/blob/main/velociraptor-v0.5.0-1-windows-amd64.msi.zip?raw=true', 'C:\terraform\velociraptor-windows-msi.zip')

# Expand the Velociraptor zip archive
Expand-Archive -LiteralPath 'C:\terraform\velociraptor-windows-msi.zip' -DestinationPath 'C:\terraform\velociraptor-windows-msi'

# Install the velociraptor MSI with quiet mode 
msiexec.exe /I C:\terraform\velociraptor-windows-msi\velociraptor-v0.5.0-1-windows-amd64.msi /quiet

Write-Host "Download Elastic, ART, and APTSimulator"

(New-Object System.Net.WebClient).DownloadFile('https://github.com/elastic/detection-rules/archive/main.zip', 'C:\terraform\Elastic_Detections.zip')

(New-Object System.Net.WebClient).DownloadFile('https://github.com/redcanaryco/atomic-red-team/archive/master.zip', 'C:\terraform\ART.zip')

(New-Object System.Net.WebClient).DownloadFile('https://github.com/NextronSystems/APTSimulator/releases/download/v0.8.0/APTSimulator_pw_apt.zip', 'C:\terraform\APTSimulator.zip')

Write-Host "Expand Elastic and ART Repos"

Expand-Archive -LiteralPath 'C:\terraform\Elastic_Detections.zip' -DestinationPath 'C:\terraform\Elastic_Detections'
Expand-Archive -LiteralPath 'C:\terraform\ART.zip' -DestinationPath 'C:\terraform\ART'
#Expand-Archive -LiteralPath 'C:\terraform\APTSimulator.zip' -DestinationPath 'C:\terraform\APTSimulator'

Write-Host "Download and install Python 3.8.6"

### Download Python 3.8
(New-Object System.Net.WebClient).DownloadFile('https://www.python.org/ftp/python/3.8.6/python-3.8.6-amd64.exe
', 'C:\terraform\python-3.8.6-amd64.exe')

### Quiet install of Python
C:\terraform\python-3.8.6-amd64.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

### Add Path environment variable
$pythonRootFolder = "C:\Users\vadmin\AppData\Local\Programs\Python\Python38"
$pythonScriptsFolder = "C:\Users\vadmin\AppData\Local\Programs\Python\Python38\Scripts"
$path = [System.Environment]::GetEnvironmentVariable('path', 'user')
$path += ";$pythonRootFolder"
$path += ";$pythonScriptsFolder;"
[System.Environment]::SetEnvironmentVariable('path', $path, 'user')

Write-Host "pip install requirements for Elastic"
#### Requirements installation
pip install -r C:\terraform\Elastic_Detections\detection-rules-main\requirements.txt

Write-Host "Install NuGet for ART"
Set-Location -Path "C:\"
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

Write-Host "Create Powershell profile to import invoke-atomicredteam with each powershell session"
Set-Content -Path C:\Users\VAdmin\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -Value 'IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1")'
Add-Content -Path C:\Users\VAdmin\Documents\WindowsPowerShell\Microsoft.Powershell_profile.ps1 -Value 'Install-AtomicRedTeam -Force'

## Now run each attack if you want, looks like you want to invoke from C: directory
# PS C:\>Invoke-AtomicTest T1003 -PathToAtomicsFolder 'C:\terraform\ART\atomic-red-team-master\atomics'
