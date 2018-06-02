#Download all assets
$sysPinURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/sysPin.exe"
$sysPinPath = "C:\Computer Repair Centre\sysPin.exe"
$crcURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/crc.bmp"
$crcPath = "C:\Computer Repair Centre\crc.bmp"
$googleChromeURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/googleChrome.ico"
$googleChromePath = "C:\Computer Repair Centre\googleChrome.ico"
$kasperskyInternetSecurityURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/kasperskyInternetSecurity.ico"
$kasperskyInternetSecurityPath = "C:\Computer Repair Centre\kasperskyInternetSecurity.ico"
$kasperskyInternetSecurityChocoURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/kis.nupkg"
$kasperskyInternetSecurityChocoPath = "C:\Computer Repair Centre\kis.nupkg"
$libreOfficeURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/libreOffice.ico"
$libreOfficePath = "C:\Computer Repair Centre\libreOffice.ico"
$mozillaFirefoxURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/mozillaFirefox.ico"
$mozillaFirefoxPath = "C:\Computer Repair Centre\mozillaFirefox.ico"
$mozillaThunderbirdURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/mozillaThunderbird.ico"
$mozillaThunderbirdPath = "C:\Computer Repair Centre\mozillaThunderbird.ico"
$teamViewerURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/teamViewer.ico"
$teamViewerPath = "C:\Computer Repair Centre\teamViewer.ico"
$vlcMediaPlayerURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/vlcMediaPlayer.ico"
$vlcMediaPlayerPath = "C:\Computer Repair Centre\vlcMediaPlayer.ico"
$birthdayURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/birthday.gif"
$birthdayPath = "C:\Computer Repair Centre\birthday.gif"
$wallpaperURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/wallpaper.ico"
$wallpaperPath = "C:\Computer Repair Centre\wallpaper.ico"
$wallpapersURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/wallpapers.zip"
$wallpapersPath = "C:\Computer Repair Centre\wallpapers.zip"
$themeSwitcher7URL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/themeSwitcher7.exe"
$themeSwitcher7Path = "C:\Computer Repair Centre\themeSwitcher7.exe"
$themeSwitcher10URL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/themeSwitcher10.exe"
$themeSwitcher10Path = "C:\Computer Repair Centre\themeSwitcher10.exe"
$windows7ThemeURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/computerRepairCentre7.theme"
$windows7ThemePath = "C:\Computer Repair Centre\computerRepairCentre7.theme"
$windows10ThemeURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/computerRepairCentre10.theme"
$windows10ThemePath = "C:\Computer Repair Centre\computerRepairCentre10.theme"
$closeURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/close.ps1"
$closePath = "C:\Computer Repair Centre\close.ps1"
$iTunesURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/iTunes.ico"
$iTunesPath = "C:\Computer Repair Centre\iTunes.ico"
Invoke-RestMethod -Uri $sysPinURL -OutFile $sysPinPath
Invoke-RestMethod -Uri $crcURL -OutFile $crcPath
Invoke-RestMethod -Uri $googleChromeURL -OutFile $googleChromePath
Invoke-RestMethod -Uri $kasperskyInternetSecurityURL -OutFile $kasperskyInternetSecurityPath
Invoke-RestMethod -Uri $kasperskyInternetSecurityChocoURL -OutFile $kasperskyInternetSecurityChocoPath
Invoke-RestMethod -Uri $libreOfficeURL -OutFile $libreOfficePath
Invoke-RestMethod -Uri $mozillaFirefoxURL -OutFile $mozillaFirefoxPath
Invoke-RestMethod -Uri $mozillaThunderbirdURL -OutFile $mozillaThunderbirdPath
Invoke-RestMethod -Uri $teamViewerURL -OutFile $teamViewerPath
Invoke-RestMethod -Uri $vlcMediaPlayerURL -OutFile $vlcMediaPlayerPath
Invoke-RestMethod -Uri $birthdayURL -OutFile $birthdayPath
Invoke-RestMethod -Uri $wallpaperURL -OutFile $wallpaperPath
Invoke-RestMethod -Uri $wallpapersURL -OutFile $wallpapersPath
Invoke-RestMethod -Uri $themeSwitcher7URL -OutFile $themeSwitcher7Path
Invoke-RestMethod -Uri $themeSwitcher10URL -OutFile $themeSwitcher10Path
Invoke-RestMethod -Uri $windows7ThemeURL -OutFile $windows7ThemePath
Invoke-RestMethod -Uri $windows10ThemeURL -OutFile $windows10ThemePath
Invoke-RestMethod -Uri $iTunesURL -OutFile $iTunesPath
Invoke-RestMethod -Uri $closeURL -OutFile $closePath
#Get information
$os = (Get-WmiObject -Class Win32_OperatingSystem).version
$ip = Invoke-RestMethod http://ipinfo.io/json | Select -exp ip
$date = Get-Date
$charlie = Get-Date -Day 06 -Month 04
$dean = Get-Date -Day 21 -Month 04
$howard = Get-Date -Day 16 -Month 05
$adam = Get-Date -Day 09 -Month 06
$steve = Get-Date -Day 24 -Month 06
$user = $env:UserName
If ($ip -like '*82.23.152.201*') {
	$libreOfficeLocation = 0
	}
else {
	$libreOfficeLocation = 1
	}
#Generate form
function GenerateForm {
	[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
	[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
	$installer = New-Object System.Windows.Forms.Form
	$install = New-Object System.Windows.Forms.Button
	$progress = New-Object System.Windows.Forms.ListBox
	$crc = New-Object System.Windows.Forms.CheckBox
	$mozillaFirefox = New-Object System.Windows.Forms.CheckBox
	$mozillaThunderbird = New-Object System.Windows.Forms.CheckBox
	$googleChrome = New-Object System.Windows.Forms.CheckBox
	$kaspersky = New-Object System.Windows.Forms.CheckBox
	$vlc = New-Object System.Windows.Forms.CheckBox
	$libreOffice = New-Object System.Windows.Forms.CheckBox
	$teamViewer = New-Object System.Windows.Forms.CheckBox
	$iTunes = New-Object System.Windows.Forms.CheckBox
	$wallpaper = New-Object System.Windows.Forms.CheckBox
	$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
	$b1= $false
	$b2= $false
	$b3= $false
#Install button
	$handler_install_Click=
		{
	  $progress.Items.Clear();
		$progress.Items.Add("Copyright Charlie Howard 2016-2018")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		if (($date.Day -eq $charlie.Day -and $date.Month -eq $charlie.Month) -or ($date.Day -eq $dean.Day -and $date.Month -eq $dean.Month) -or ($date.Day -eq $howard.Day -and $date.Month -eq $howard.Month) -or ($date.Day -eq $adam.Day -and $date.Month -eq $adam.Month) -or ($date.Day -eq $steve.Day -and $date.Month -eq $steve.Month)) {
			$CreateDialog = {
				Param ($Form)
				Start-Sleep -s 30
				$Form.Close()
				}
			Add-Type -AssemblyName System.Windows.Forms
			$birthday = New-Object System.Windows.Forms.Form
			$birthday.Text = ""
			$birthday.TopMost = $true
			$birthday.Width = 450
			$birthday.Height = 240
			$birthday.Icon = "C:\Computer Repair Centre\crc.ico"
			$birthdayGIF = New-Object system.windows.Forms.PictureBox
			$birthdayGIF.Width = 480
			$birthdayGIF.Height = 332
			$birthdayGIF.ImageLocation = "C:\Computer Repair Centre\birthday.gif"
			$birthdayGIF.location = new-object system.drawing.point(-30,-70)
			$birthday.controls.Add($birthdayGIF)
			$Runspace = [RunspaceFactory]::CreateRunspace()
			$PowerShell = [PowerShell]::Create()
			$PowerShell.Runspace = $Runspace
			$Runspace.Open()
			$Params =
			@{
				Form = $birthday
			}
			$PowerShell.AddScript($CreateDialog).AddParameters($Params) | Out-Null
			$AsyncObject = $PowerShell.BeginInvoke()
			$birthday.ShowDialog()
			$PowerShell.EndInvoke($AsyncObject) | Out-Null
			$PowerShell.Dispose()
		}
		if ($crc.Checked)	{
			$progress.Items.Add("CRC OEM is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
		    $progress.Items.Add("Starting installation of CRC OEM information...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			if ($ip -like '*212.159.116.68*') {
				$progress.Items.Add("Installer being run from Romsey.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Logo -value "C:\Computer Repair Centre\crc.bmp"
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Manufacturer -value "Computer Repair Centre"
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportHours -value "Mon-Sat 9:15am-5pm - Wed 9:15am-4pm"
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportPhone -value "01794 517142"
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportURL -value "https://www.firstforitrepairs.co.uk"
			}
		elseIf ($ip -like '*82.0.43.224*') {
			$progress.Items.Add("Installer being run from Chandlers Ford.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Logo -value "C:\Computer Repair Centre\CRC.bmp"
			Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Manufacturer -value "Computer Repair Centre"
			Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportHours -value "Mon-Fri 9am-5pm - Sat 9am-4pm"
			Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportPhone -value "08712 244129"
			Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportURL -value "https://www.brmcomputers.co.uk"
			}
			$progress.Items.Add("Completed installation of CRC OEM information.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		$progress.Items.Add("Starting installation of all requisites...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
		choco install dotnet4.5 -y
		choco install dotnet4.6.1 -y
		choco install powershell -y
		choco install 7zip.install -y --ignore-checksum
		$progress.Items.Add("Completed installation of all requisites...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
	  if ($googleChrome.Checked)	{
			$progress.Items.Add("Google Chrome is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of Google Chrome...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install googlechrome -y --ignore-checksum
			$Programs = choco list --localonly
			if ($Programs -like '*GoogleChrome*') {
				$progress.Items.Add("Completed installation of Google Chrome.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of Google Chrome has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
	  if ($iTunes.Checked)	{
			$progress.Items.Add("iTunes is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of iTunes...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install itunes -y --ignore-checksum
			$Programs = choco list --localonly
			if ($Programs -like '*iTunes*') {
				$progress.Items.Add("Completed installation of iTunes.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of iTunes has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($kaspersky.Checked)	{
			$progress.Items.Add("Kaspersky Internet Security 2019 is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of Kaspersky Internet Security 2019...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install kis -y --ignore-checksum
			$Programs = choco list --localonly
			if ($Programs -like '*kis*') {
				$progress.Items.Add("Completed installation of Kaspersky Internet Security 2019.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of Kaspersky Internet Security 2019 has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($libreOffice.Checked)	{
			$progress.Items.Add("LibreOffice is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of LibreOffice...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install libreoffice -y --ignore-checksum
			$Programs = choco list --localonly
			if ($Programs -like '*libreoffice*') {
				$progress.Items.Add("Completed installation of LibreOffice.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of LibreOffice has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
	    if ($mozillaFirefox.Checked)	{
			$progress.Items.Add("Mozilla Firefox Quantum is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of Mozilla Firefox Quantum...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install firefox -y --ignore-checksum
			$Programs = choco list --localonly
			if ($Programs -like '*Firefox*') {
				$progress.Items.Add("Completed installation of Mozilla Firefox Quantum.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of Mozilla Firefox Quantum has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($mozillaThunderbird.Checked)	{
			$progress.Items.Add("Mozilla Thunderbird is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of Mozilla Thunderbird...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install thunderbird -y --ignore-checksum
			$Programs = choco list --localonly
			if ($Programs -like '*thunderbird*') {
				$progress.Items.Add("Completed installation of Mozilla Thunderbird.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of Mozilla Thunderbird has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($teamViewer.Checked)	{
			$progress.Items.Add("TeamViewer is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of TeamViewer...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install teamviewer -y --ignore-checksum
			$Programs = choco list --localonly
			if ($Programs -like '*teamviewer*') {
				$progress.Items.Add("Completed installation of TeamViewer.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of TeamViewer has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($vlc.Checked)	{
			$progress.Items.Add("VLC Media Player is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of VLC Media Player...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install vlc -y --ignore-checksum
			$Programs = choco list --localonly
			if ($Programs -like '*vlc*') {
				$progress.Items.Add("Completed installation of VLC Media Player.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of VLC Media Player has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($os -like '*6.1*')	{
			$progress.Items.Add("This computer is running Windows 7.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting taskbar icons...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites"
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files\Mozilla Firefox\firefox.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Windows\explorer.exe" c:5386
			if ($wallpaper.Checked)	{
					$progress.Items.Add("Set wallpapers is checked."  )
					$progress.SelectedIndex = $progress.Items.Count - 1;
					$progress.SelectedIndex = -1;
					$progress.Items.Add("Setting wallpapers...")
					$progress.SelectedIndex = $progress.Items.Count - 1;
					$progress.SelectedIndex = -1;
					& 'C:\Program Files\7-Zip\7z.exe' e "C:\Computer Repair Centre\wallpapers.zip" "-oC:\Computer Repair Centre\Wallpapers"
					& 'C:\Computer Repair Centre\themeSwitcher7.exe' "C:\Computer Repair Centre\computerRepairCentre7.theme"
					}
			$progress.Items.Add("Disabling stanby and monitor timeout when plugged in...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			powercfg -change -standby-timeout-ac 0
			powercfg -change -monitor-timeout-ac 0
			$progress.Items.Add("Setting random wallpaper.")
			$progress.Items.Add("Auto-arranging Desktop icons...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" -Name "FFlags" -Type DWord -Value 1075839525
			$progress.Items.Add("The installer has finished! The installer will close in 20 seconds.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($os -like '*6.2*')	{
			$progress.Items.Add("This computer is running Windows 8.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting taskbar icons...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites"
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files\Mozilla Firefox\firefox.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Windows\explorer.exe" c:5386
			if ($wallpaper.Checked)	{
					$progress.Items.Add("Set wallpapers is checked."  )
					$progress.SelectedIndex = $progress.Items.Count - 1;
					$progress.SelectedIndex = -1;
					$progress.Items.Add("Setting wallpapers...")
					$progress.SelectedIndex = $progress.Items.Count - 1;
					$progress.SelectedIndex = -1;
					& 'C:\Program Files\7-Zip\7z.exe' e "C:\Computer Repair Centre\wallpapers.zip" "-oC:\Computer Repair Centre\Wallpapers"
					& 'C:\Computer Repair Centre\themeSwitcher10.exe' "C:\Computer Repair Centre\computerRepairCentre10.theme"
					}
			$progress.Items.Add("Disabling stanby and monitor timeout when plugged in...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			powercfg -change -standby-timeout-ac 0
			powercfg -change -monitor-timeout-ac 0
			$progress.Items.Add("The installer has finished! The installer will close in 20 seconds.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($os -like '*6.3*')	{
			$progress.Items.Add("This computer is running Windows 8.1.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting taskbar icons...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites"
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files\Mozilla Firefox\firefox.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Windows\explorer.exe" c:5386
			if ($wallpaper.Checked)	{
					$progress.Items.Add("Set wallpapers is checked."  )
					$progress.SelectedIndex = $progress.Items.Count - 1;
					$progress.SelectedIndex = -1;
					$progress.Items.Add("Setting wallpapers...")
					$progress.SelectedIndex = $progress.Items.Count - 1;
					$progress.SelectedIndex = -1;
					& 'C:\Program Files\7-Zip\7z.exe' e "C:\Computer Repair Centre\wallpapers.zip" "-oC:\Computer Repair Centre\Wallpapers"
					& 'C:\Computer Repair Centre\themeSwitcher10.exe' "C:\Computer Repair Centre\computerRepairCentre10.theme"
					}
			$progress.Items.Add("Disabling stanby and monitor timeout when plugged in...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
		  $progress.SelectedIndex = -1;
			powercfg -change -standby-timeout-ac 0
			powercfg -change -monitor-timeout-ac 0
			$progress.Items.Add("The installer has finished! The installer will close in 20 seconds.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($os -like '*10.0*')	{
			$progress.Items.Add("This computer is running Windows 10.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting explorer to open to This PC...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name LaunchTo -value 1
			$progress.Items.Add("Setting taskbar icons...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites"
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files\Mozilla Firefox\firefox.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Windows\explorer.exe" c:5386
			$progress.Items.Add("Deleting Microsoft Edge from Desktop...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Remove-Item "$Home\Desktop\Microsoft Edge.lnk" -Force
			if ($wallpaper.Checked)	{
					$progress.Items.Add("Set wallpapers is checked."  )
					$progress.SelectedIndex = $progress.Items.Count - 1;
					$progress.SelectedIndex = -1;
					$progress.Items.Add("Setting wallpapers...")
					$progress.SelectedIndex = $progress.Items.Count - 1;
					$progress.SelectedIndex = -1;
					Remove-Item "C:\Computer Repair Centre\Wallpapers" -Recurse -Force
					& 'C:\Program Files\7-Zip\7z.exe' e "C:\Computer Repair Centre\wallpapers.zip" "-oC:\Computer Repair Centre\Wallpapers"
					& 'C:\Computer Repair Centre\themeSwitcher10.exe' "C:\Computer Repair Centre\computerRepairCentre10.theme"
					}
			$progress.Items.Add("Disabling fastboot mode...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -name HiberbootEnabled -value 0
			$progress.Items.Add("Disabling Wi-Fi Sense...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Force | Out-Null
			Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
			Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
			$progress.Items.Add("Disabling People icon...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" | Out-Null
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0
			$progress.Items.Add("Hiding recently used files and folders in Explorer...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowRecent" -Type DWord -Value 0
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowFrequent" -Type DWord -Value 0
			$progress.Items.Add("Disabling Action Center...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Type DWord -Value 1
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Type DWord -Value 0
			$progress.Items.Add("Disabling stanby and monitor timeout when plugged in...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			powercfg -change -standby-timeout-ac 0
			powercfg -change -monitor-timeout-ac 0
			$progress.Items.Add("Auto-arranging Desktop icons...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" -Name "FFlags" -Type DWord -Value 1075839525
			$progress.Items.Add("The installer has finished! The installer will close in 20 seconds.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		Start-Sleep -s 20
		$installer.Close()
		& "C:\Computer Repair Centre\close.ps1"
	}
	$OnLoadForm_StateCorrection=
	{
	    $installer.WindowState = $InitialFormWindowState
	}
#Main form
	$installer.Text = "CRC Installer v2.5.1"
	$installer.Name = "form1"
	$installer.DataBindings.DefaultDataSourceUpdateMode = 0
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 650
	$System_Drawing_Size.Height = 330
	$installer.ClientSize = $System_Drawing_Size
	$installer.Icon = "C:\Computer Repair Centre\crc.ico"
#Install button
	$install.TabIndex = 4
	$install.Name = "install"
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 75
	$System_Drawing_Size.Height = 23
	$install.Size = $System_Drawing_Size
	$install.UseVisualStyleBackColor = $True
	$install.Text = "Install"
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 200
	$System_Drawing_Point.Y = 13
	$install.Location = $System_Drawing_Point
	$install.DataBindings.DefaultDataSourceUpdateMode = 0
	$install.add_Click($handler_install_Click)
	$installer.Controls.Add($install)
#Progress box
	$progress.FormattingEnabled = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 350
	$System_Drawing_Size.Height = 310
	$progress.Size = $System_Drawing_Size
	$progress.DataBindings.DefaultDataSourceUpdateMode = 0
	$progress.Name = "listBox1"
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 287
	$System_Drawing_Point.Y = 13
	$progress.Location = $System_Drawing_Point
	$progress.TabIndex = 3
	$installer.Controls.Add($progress)
#CRC OEM
	$crc.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$crc.Size = $System_Drawing_Size
	$crc.TabIndex = 0
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 13
	$crc.Location = $System_Drawing_Point
	$crc.DataBindings.DefaultDataSourceUpdateMode = 0
	$crc.Name = "crc"
	$crc.Checked = 1
	$crc.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\crc.ico")
	$installer.Controls.Add($crc)
#Wallpaper
	$wallpaper.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$wallpaper.Size = $System_Drawing_Size
	$wallpaper.TabIndex = 4
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 44
	$wallpaper.Location = $System_Drawing_Point
	$wallpaper.DataBindings.DefaultDataSourceUpdateMode = 0
	$wallpaper.Name = "vlc"
	$wallpaper.Checked = 1
	$wallpaper.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\wallpaper.ico")
	$installer.Controls.Add($wallpaper)
#Google Chrome
	$googleChrome.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$googleChrome.Size = $System_Drawing_Size
	$googleChrome.TabIndex = 2
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 75
	$googleChrome.Location = $System_Drawing_Point
	$googleChrome.DataBindings.DefaultDataSourceUpdateMode = 0
	$googleChrome.Name = "googleChrome"
	$googleChrome.Checked = 1
	$googleChrome.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\googleChrome.ico")
	$installer.Controls.Add($googleChrome)
#iTunes
	$iTunes.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$iTunes.Size = $System_Drawing_Size
	$iTunes.TabIndex = 2
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 106
	$iTunes.Location = $System_Drawing_Point
	$iTunes.DataBindings.DefaultDataSourceUpdateMode = 0
	$iTunes.Name = "iTunes"
	$iTunes.Checked = 0
	$iTunes.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\iTunes.ico")
	$installer.Controls.Add($iTunes)
#Kaspersky Internet Security
	$kaspersky.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$kaspersky.Size = $System_Drawing_Size
	$kaspersky.TabIndex = 3
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 137
	$kaspersky.Location = $System_Drawing_Point
	$kaspersky.DataBindings.DefaultDataSourceUpdateMode = 0
	$kaspersky.Name = "kaspersky"
	$kaspersky.Checked = 1
	$kaspersky.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\kasperskyInternetSecurity.ico")
	$installer.Controls.Add($kaspersky)
#LibreOffice
	$libreOffice.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$libreOffice.Size = $System_Drawing_Size
	$libreOffice.TabIndex = 6
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 168
	$libreOffice.Location = $System_Drawing_Point
	$libreOffice.DataBindings.DefaultDataSourceUpdateMode = 0
	$libreOffice.Name = "libreOffice"
	$libreOffice.Checked = $libreOfficeLocation
	$libreOffice.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\libreOffice.ico")
	$installer.Controls.Add($libreOffice)
#Mozilla Firefox
	$mozillaFirefox.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$mozillaFirefox.Size = $System_Drawing_Size
	$mozillaFirefox.TabIndex = 1
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 199
	$mozillaFirefox.Location = $System_Drawing_Point
	$mozillaFirefox.DataBindings.DefaultDataSourceUpdateMode = 0
	$mozillaFirefox.Name = "mozillaFirefox"
	$mozillaFirefox.Checked = 1
	$mozillaFirefox.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\mozillaFirefox.ico")
	$installer.Controls.Add($mozillaFirefox)
#Mozilla Thunderbird
	$mozillaThunderbird.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$mozillaThunderbird.Size = $System_Drawing_Size
	$mozillaThunderbird.TabIndex = 1
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 230
	$mozillaThunderbird.Location = $System_Drawing_Point
	$mozillaThunderbird.DataBindings.DefaultDataSourceUpdateMode = 0
	$mozillaThunderbird.Name = "mozillaThunderbird"
	$mozillaThunderbird.Checked = 0
	$mozillaThunderbird.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\mozillaThunderbird.ico")
	$installer.Controls.Add($mozillaThunderbird)
#TeamViewer
	$teamViewer.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$teamViewer.Size = $System_Drawing_Size
	$teamViewer.TabIndex = 7
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 261
	$teamViewer.Location = $System_Drawing_Point
	$teamViewer.DataBindings.DefaultDataSourceUpdateMode = 0
	$teamViewer.Name = "teamViewer"
	$teamViewer.Checked = 1
	$teamViewer.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\teamViewer.ico")
	$installer.Controls.Add($teamViewer)
#VLC Media Player
	$vlc.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$vlc.Size = $System_Drawing_Size
	$vlc.TabIndex = 4
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 292
	$vlc.Location = $System_Drawing_Point
	$vlc.DataBindings.DefaultDataSourceUpdateMode = 0
	$vlc.Name = "vlc"
	$vlc.Checked = 1
	$vlc.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\vlcMediaPlayer.ico")
	$installer.Controls.Add($vlc)
#Form
	$InitialFormWindowState = $installer.WindowState
	$installer.add_Load($OnLoadForm_StateCorrection)
	$installer.ShowDialog() | Out-Null
	}
GenerateForm
