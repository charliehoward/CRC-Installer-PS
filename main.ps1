#Download all assets
$crcURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/crc.bmp"
$crcPath = "C:\Computer Repair Centre\crc.bmp"
$googleChromeURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/googleChrome.ico"
$googleChromePath = "C:\Computer Repair Centre\googleChrome.ico"
$kasperskyInternetSecurityURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/kasperskyInternetSecurity.ico"
$kasperskyInternetSecurityPath = "C:\Computer Repair Centre\kasperskyInternetSecurity.ico"
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
$iTunesURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/iTunes.ico"
$iTunesPath = "C:\Computer Repair Centre\iTunes.ico"
$northPointURL = "https://gitlab.com/charliehoward/NorthPointInstaller/raw/master/NorthPoint%20Installer%20x64.exe"
$northPointPath = "$Home\Desktop\CRC Installer x64.exe"
Invoke-RestMethod -Uri $crcURL -OutFile $crcPath
Invoke-RestMethod -Uri $googleChromeURL -OutFile $googleChromePath
Invoke-RestMethod -Uri $kasperskyInternetSecurityURL -OutFile $kasperskyInternetSecurityPath
Invoke-RestMethod -Uri $libreOfficeURL -OutFile $libreOfficePath
Invoke-RestMethod -Uri $mozillaFirefoxURL -OutFile $mozillaFirefoxPath
Invoke-RestMethod -Uri $mozillaThunderbirdURL -OutFile $mozillaThunderbirdPath
Invoke-RestMethod -Uri $teamViewerURL -OutFile $teamViewerPath
Invoke-RestMethod -Uri $vlcMediaPlayerURL -OutFile $vlcMediaPlayerPath
Invoke-RestMethod -Uri $birthdayURL -OutFile $birthdayPath
Invoke-RestMethod -Uri $wallpaperURL -OutFile $wallpaperPath
Invoke-RestMethod -Uri $iTunesURL -OutFile $iTunesPath
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
If ($ip -like '*82.0.43.224*') {
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
		$progress.Items.Add("Copyright (c) Charlie Howard 2016-2018 All rights reserved.")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		$progress.Items.Add("New version is available and has been downloaded onto the Desktop, please update all the USB keys.")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		Invoke-RestMethod -Uri $northPointURL -OutFile $northPointPath
		Start-Sleep -s 60
		$installer.Close()
		& "C:\Computer Repair Centre\close.ps1"
	}
	$OnLoadForm_StateCorrection=
	{
	    $installer.WindowState = $InitialFormWindowState
	}
#Main form
	$installer.Text = "CRC Installer v2.7.0"
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
