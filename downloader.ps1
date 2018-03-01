New-Item -ItemType directory -Path "C:\Computer Repair Centre\"
$mainURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/main.ps1"
$mainPath = "C:\Computer Repair Centre\main.ps1"
$iconURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/crc.ico"
$iconPath = "C:\Computer Repair Centre\crc.ico"
Invoke-RestMethod -Uri $mainURL -OutFile $mainPath
Invoke-RestMethod -Uri $iconURL -OutFile $iconPath
& "C:\Computer Repair Centre\main.ps1"