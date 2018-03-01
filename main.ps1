#Download all assets
$sysPinURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/sysPin.exe"
$sysPinPath = "C:\Computer Repair Centre\sysPin.exe"
$crcURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/crc.bmp"
$crcPath = "C:\Computer Repair Centre\crc.bmp"
$7zipURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/7zip.ico"
$7zipPath = "C:\Computer Repair Centre\7zip.ico"
$googleChromeURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/googleChrome.ico"
$googleChromePath = "C:\Computer Repair Centre\googleChrome.ico"
$kasperskyInternetSecurityURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/kasperskyInternetSecurity.ico"
$kasperskyInternetSecurityPath = "C:\Computer Repair Centre\kasperskyInternetSecurity.ico"
$libreOfficeURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/libreOffice.ico"
$libreOfficePath = "C:\Computer Repair Centre\libreOffice.ico"
$mozillaFirefoxURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/mozillaFirefox.ico"
$mozillaFirefoxPath = "C:\Computer Repair Centre\mozillaFirefox.ico"
$teamViewerURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/teamViewer.ico"
$teamViewerPath = "C:\Computer Repair Centre\teamViewer.ico"
$vlcMediaPlayerURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/vlcMediaPlayer.ico"
$vlcMediaPlayerPath = "C:\Computer Repair Centre\vlcMediaPlayer.ico"
$birthdayURL = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/assets/birthday.gif"
$birthdayPath = "C:\Computer Repair Centre\birthday.gif"
Invoke-RestMethod -Uri $sysPinURL -OutFile $sysPinPath
Invoke-RestMethod -Uri $crcURL -OutFile $crcPath
Invoke-RestMethod -Uri $7zipURL -OutFile $7zipPath
Invoke-RestMethod -Uri $googleChromeURL -OutFile $googleChromePath
Invoke-RestMethod -Uri $kasperskyInternetSecurityURL -OutFile $kasperskyInternetSecurityPath
Invoke-RestMethod -Uri $libreOfficeURL -OutFile $libreOfficePath
Invoke-RestMethod -Uri $mozillaFirefoxURL -OutFile $mozillaFirefoxPath
Invoke-RestMethod -Uri $teamViewerURL -OutFile $teamViewerPath
Invoke-RestMethod -Uri $vlcMediaPlayerURL -OutFile $vlcMediaPlayerPath
Invoke-RestMethod -Uri $birthdayURL -OutFile $birthdayPath

#Get OS version
$os = (Get-WmiObject -Class Win32_OperatingSystem).version

#Get date and time
$date = Get-Date -Format "yyyy.MM.dd HH.mm"

#Find external IP
$ip = Invoke-RestMethod http://ipinfo.io/json | Select -exp ip

#Get current username
$user = $env:UserName

#Generate form
	function GenerateForm {
	[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
	[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
	$installer = New-Object System.Windows.Forms.Form
	$install = New-Object System.Windows.Forms.Button
	$progress = New-Object System.Windows.Forms.ListBox
	$crc = New-Object System.Windows.Forms.CheckBox
	$mozillaFirefox = New-Object System.Windows.Forms.CheckBox
	$googleChrome = New-Object System.Windows.Forms.CheckBox
	$kaspersky = New-Object System.Windows.Forms.CheckBox
	$vlc = New-Object System.Windows.Forms.CheckBox
	$7zip = New-Object System.Windows.Forms.CheckBox
	$libreOffice = New-Object System.Windows.Forms.CheckBox
	$teamViewer = New-Object System.Windows.Forms.CheckBox
	$ApacheOpenOffice = New-Object System.Windows.Forms.CheckBox
	$wpsOffice = New-Object System.Windows.Forms.CheckBox
	$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
	$b1= $false
	$b2= $false
	$b3= $false

#Install button
	$handler_install_Click=
	{
	    $progress.Items.Clear();
		$progress.Items.Add("The date is $date."  )
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		$progress.Items.Add("The public IP is $ip."  )
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		if ($date -like '*.04.21*') {
			$CreateDialog =
			{
			    Param
			    (
			        $Form
			    )
				Start-Sleep -s 20
			    $Form.Close()
			}
			# Create our Form object
			Add-Type -AssemblyName System.Windows.Forms
			$birthday = New-Object System.Windows.Forms.Form
			$birthday.Text = ""
			$birthday.TopMost = $true
			$birthday.Width = 450
			$birthday.Height = 240
			$birthday.Icon = "C:\Computer Repair Centre\crc.ico"
			# Create birthday gif
			$birthdayGIF = New-Object system.windows.Forms.PictureBox
			$birthdayGIF.Width = 480
			$birthdayGIF.Height = 332
			$birthdayGIF.ImageLocation = "C:\Computer Repair Centre\birthday.gif"
			$birthdayGIF.location = new-object system.drawing.point(-30,-70)
			$birthday.controls.Add($birthdayGIF)
			# Create new runspace
			$Runspace = [RunspaceFactory]::CreateRunspace()
			$PowerShell = [PowerShell]::Create()
			$PowerShell.Runspace = $Runspace
			$Runspace.Open()
			# Set parameters to pass to new thread.
			$Params =
			@{
			    Form = $birthday
			}
			# Add the codeblock and parameters to the runspace
			$PowerShell.AddScript($CreateDialog).AddParameters($Params) | Out-Null
			# Start the runspace (this is done before calling ShowDialog() for the form.  Otherwise it would halt script execution)
			$AsyncObject = $PowerShell.BeginInvoke()
			# Fire up our form
			$birthday.ShowDialog()
			# Cleanup (don't want memory leaks)
			$PowerShell.EndInvoke($AsyncObject) | Out-Null
			$PowerShell.Dispose()
			}
		if ($date -like '*.04.06*') {
			$CreateDialog =
			{
			    Param
			    (
			        $Form
			    )
				Start-Sleep -s 20
			    $Form.Close()
			}
			# Create our Form object
			Add-Type -AssemblyName System.Windows.Forms
			$birthday = New-Object System.Windows.Forms.Form
			$birthday.Text = ""
			$birthday.TopMost = $true
			$birthday.Width = 450
			$birthday.Height = 240
			$birthday.Icon = "C:\Computer Repair Centre\crc.ico"
			# Create birthday gif
			$birthdayGIF = New-Object system.windows.Forms.PictureBox
			$birthdayGIF.Width = 480
			$birthdayGIF.Height = 332
			$birthdayGIF.ImageLocation = "C:\Computer Repair Centre\birthday.gif"
			$birthdayGIF.location = new-object system.drawing.point(-30,-70)
			$birthday.controls.Add($birthdayGIF)
			# Create new runspace
			$Runspace = [RunspaceFactory]::CreateRunspace()
			$PowerShell = [PowerShell]::Create()
			$PowerShell.Runspace = $Runspace
			$Runspace.Open()
			# Set parameters to pass to new thread.
			$Params =
			@{
			    Form = $birthday
			}
			# Add the codeblock and parameters to the runspace
			$PowerShell.AddScript($CreateDialog).AddParameters($Params) | Out-Null
			# Start the runspace (this is done before calling ShowDialog() for the form.  Otherwise it would halt script execution)
			$AsyncObject = $PowerShell.BeginInvoke()
			# Fire up our form
			$birthday.ShowDialog()
			# Cleanup (don't want memory leaks)
			$PowerShell.EndInvoke($AsyncObject) | Out-Null
			$PowerShell.Dispose()
			}
		if ($date -like '*.06.09*') {
			$CreateDialog =
			{
			    Param
			    (
			        $Form
			    )
				Start-Sleep -s 20
			    $Form.Close()
			}
			# Create our Form object
			Add-Type -AssemblyName System.Windows.Forms
			$birthday = New-Object System.Windows.Forms.Form
			$birthday.Text = ""
			$birthday.TopMost = $true
			$birthday.Width = 450
			$birthday.Height = 240
			$birthday.Icon = "C:\Computer Repair Centre\crc.ico"
			# Create birthday gif
			$birthdayGIF = New-Object system.windows.Forms.PictureBox
			$birthdayGIF.Width = 480
			$birthdayGIF.Height = 332
			$birthdayGIF.ImageLocation = "C:\Computer Repair Centre\birthday.gif"
			$birthdayGIF.location = new-object system.drawing.point(-30,-70)
			$birthday.controls.Add($birthdayGIF)
			# Create new runspace
			$Runspace = [RunspaceFactory]::CreateRunspace()
			$PowerShell = [PowerShell]::Create()
			$PowerShell.Runspace = $Runspace
			$Runspace.Open()
			# Set parameters to pass to new thread.
			$Params =
			@{
			    Form = $birthday
			}
			# Add the codeblock and parameters to the runspace
			$PowerShell.AddScript($CreateDialog).AddParameters($Params) | Out-Null
			# Start the runspace (this is done before calling ShowDialog() for the form.  Otherwise it would halt script execution)
			$AsyncObject = $PowerShell.BeginInvoke()
			# Fire up our form
			$birthday.ShowDialog()
			# Cleanup (don't want memory leaks)
			$PowerShell.EndInvoke($AsyncObject) | Out-Null
			$PowerShell.Dispose()
			}
		if ($date -like '*.05.16*') {
			$CreateDialog =
			{
			    Param
			    (
			        $Form
			    )
				Start-Sleep -s 20
			    $Form.Close()
			}
			# Create our Form object
			Add-Type -AssemblyName System.Windows.Forms
			$birthday = New-Object System.Windows.Forms.Form
			$birthday.Text = ""
			$birthday.TopMost = $true
			$birthday.Width = 450
			$birthday.Height = 240
			$birthday.Icon = "C:\Computer Repair Centre\crc.ico"
			# Create birthday gif
			$birthdayGIF = New-Object system.windows.Forms.PictureBox
			$birthdayGIF.Width = 480
			$birthdayGIF.Height = 332
			$birthdayGIF.ImageLocation = "C:\Computer Repair Centre\birthday.gif"
			$birthdayGIF.location = new-object system.drawing.point(-30,-70)
			$birthday.controls.Add($birthdayGIF)
			# Create new runspace
			$Runspace = [RunspaceFactory]::CreateRunspace()
			$PowerShell = [PowerShell]::Create()
			$PowerShell.Runspace = $Runspace
			$Runspace.Open()
			# Set parameters to pass to new thread.
			$Params =
			@{
			    Form = $birthday
			}
			# Add the codeblock and parameters to the runspace
			$PowerShell.AddScript($CreateDialog).AddParameters($Params) | Out-Null
			# Start the runspace (this is done before calling ShowDialog() for the form.  Otherwise it would halt script execution)
			$AsyncObject = $PowerShell.BeginInvoke()
			# Fire up our form
			$birthday.ShowDialog()
			# Cleanup (don't want memory leaks)
			$PowerShell.EndInvoke($AsyncObject) | Out-Null
			$PowerShell.Dispose()
			}
		if ($date -like '*.06.24*') {
			$CreateDialog =
			{
			    Param
			    (
			        $Form
			    )
				Start-Sleep -s 20
			    $Form.Close()
			}
			# Create our Form object
			Add-Type -AssemblyName System.Windows.Forms
			$birthday = New-Object System.Windows.Forms.Form
			$birthday.Text = ""
			$birthday.TopMost = $true
			$birthday.Width = 450
			$birthday.Height = 240
			$birthday.Icon = "C:\Computer Repair Centre\crc.ico"
			# Create birthday gif
			$birthdayGIF = New-Object system.windows.Forms.PictureBox
			$birthdayGIF.Width = 480
			$birthdayGIF.Height = 332
			$birthdayGIF.ImageLocation = "C:\Computer Repair Centre\birthday.gif"
			$birthdayGIF.location = new-object system.drawing.point(-30,-70)
			$birthday.controls.Add($birthdayGIF)
			# Create new runspace
			$Runspace = [RunspaceFactory]::CreateRunspace()
			$PowerShell = [PowerShell]::Create()
			$PowerShell.Runspace = $Runspace
			$Runspace.Open()
			# Set parameters to pass to new thread.
			$Params =
			@{
			    Form = $birthday
			}
			# Add the codeblock and parameters to the runspace
			$PowerShell.AddScript($CreateDialog).AddParameters($Params) | Out-Null
			# Start the runspace (this is done before calling ShowDialog() for the form.  Otherwise it would halt script execution)
			$AsyncObject = $PowerShell.BeginInvoke()
			# Fire up our form
			$birthday.ShowDialog()
			# Cleanup (don't want memory leaks)
			$PowerShell.EndInvoke($AsyncObject) | Out-Null
			$PowerShell.Dispose()
			}
			if ($crc.Checked)	{
			$progress.Items.Add("CRC OEM is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
		    $progress.Items.Add("Starting installation of CRC OEM information ...")
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
			elseIf ($ip -like '*82.23.152.201*') {
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
		$progress.Items.Add("Starting installation of Chocolately ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
		$Programs = choco list --localonly
		if ($Programs -like '*chocolatey*') {
			$progress.Items.Add("Completed installation of Chocolatey.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		else {
			$progress.Items.Add("The installation of Chocolatey has failed.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		$progress.Items.Add("Starting installation of DotNet 4.5 ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		choco install dotnet4.5 -y
		$Programs = choco list --localonly
		if ($Programs -like '*DotNet4.5*') {
			$progress.Items.Add("Completed installation of DotNet 4.5.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		else {
			$progress.Items.Add("The installation of DotNet 4.5 has failed.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		$progress.Items.Add("Starting installation of DotNet 4.6.1 ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		choco install dotnet4.6.1 -y
		$Programs = choco list --localonly
		if ($Programs -like '*DotNet4.6.1*') {
			$progress.Items.Add("Completed installation of DotNet 4.6.1.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		else {
			$progress.Items.Add("The installation of DotNet 4.6.1 has failed.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		$progress.Items.Add("Starting installation of PowerShell 5 ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		choco install powershell -y
		$Programs = choco list --localonly
		if ($Programs -like '*PowerShell 5*') {
			$progress.Items.Add("Completed installation of PowerShell 5.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		else {
			$progress.Items.Add("The installation of PowerShell 5 has failed.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($7zip.Checked)	{
			$progress.Items.Add("7-zip is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of 7-zip ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install 7zip.install -y --ignore-checksum
			$Programs = choco list --localonly
			if ($Programs -like '*7zip*') {
				$progress.Items.Add("Completed installation of 7-zip.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of 7-zip has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
	    if ($googleChrome.Checked)	{
			$progress.Items.Add("Google Chrome is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of Google Chrome ...")
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
		if ($kaspersky.Checked)	{
			$progress.Items.Add("Kaspersky Internet Security 2017 is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of Kaspersky Internet Security 2017 ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install kis -y --ignore-checksum
			$Programs = choco list --localonly
			if ($Programs -like '*kis*') {
				$progress.Items.Add("Completed installation of Kaspersky Internet Security 2017.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of Kaspersky Internet Security 2017 has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($libreOffice.Checked)	{
			$progress.Items.Add("LibreOffice is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of LibreOffice ...")
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
			$progress.Items.Add("Starting installation of Mozilla Firefox Quantum ...")
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
		if ($teamViewer.Checked)	{
			$progress.Items.Add("TeamViewer is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of TeamViewer ...")
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
			$progress.Items.Add("Starting installation of VLC Media Player ...")
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
	    if (!$crc.Checked -and !$7zip.Checked -and !$googleChrome.Checked -and !$kaspersky.Checked -and !$libreOffice.Checked -and !$mozillaFirefox.Checked -and !$teamViewer.Checked -and !$vlc.Checked){
			$progress.Items.Add("No programs are selected, please select some programs to install.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($os -like '*6.1*')	{
			$progress.Items.Add("This computer is running Windows 7.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting taskbar icons ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites"
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files\Mozilla Firefox\firefox.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Windows\explorer.exe" c:5386
			$progress.Items.Add("The install has finished!")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($os -like '*6.2*')	{
			$progress.Items.Add("This computer is running Windows 8.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting taskbar icons ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites"
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files\Mozilla Firefox\firefox.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Windows\explorer.exe" c:5386
			$progress.Items.Add("The install has finished!")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($os -like '*6.3*')	{
			$progress.Items.Add("This computer is running Windows 8.1.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting taskbar icons ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites"
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files\Mozilla Firefox\firefox.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Windows\explorer.exe" c:5386
			$progress.Items.Add("The install has finished!")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($os -like '*10.0*')	{
			$progress.Items.Add("This computer is running Windows 10.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting explorer to open to This PC ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name LaunchTo -value 1
			$progress.Items.Add("Setting taskbar icons ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites"
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Program Files\Mozilla Firefox\firefox.exe" c:5386
			& "C:\Computer Repair Centre\sysPin.exe" "C:\Windows\explorer.exe" c:5386
			$progress.Items.Add("Disabling fastboot mode ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -name HiberbootEnabled -value 0
			$progress.Items.Add("Disabling Wi-Fi Sense ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Force | Out-Null
			Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
			Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
			$progress.Items.Add("Disabling People icon ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" | Out-Null
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0
			$progress.Items.Add("Hiding recently used files and folders in Explorer ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowRecent" -Type DWord -Value 0
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowFrequent" -Type DWord -Value 0
			$progress.Items.Add("Disabling Action Center ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Type DWord -Value 1
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Type DWord -Value 0
			$progress.Items.Add("The install has finished! The installer will close in 15 seconds.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		Start-Sleep -s 15
		$installer.Close()
	}
	$OnLoadForm_StateCorrection=
	{
	    $installer.WindowState = $InitialFormWindowState
	}

#Main form
	$installer.Text = "CRC Installer v2.0.0"
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

#Google Chrome
	$googleChrome.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$googleChrome.Size = $System_Drawing_Size
	$googleChrome.TabIndex = 2
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 106
	$googleChrome.Location = $System_Drawing_Point
	$googleChrome.DataBindings.DefaultDataSourceUpdateMode = 0
	$googleChrome.Name = "googleChrome"
	$googleChrome.Checked = 1
	$googleChrome.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\googleChrome.ico")
	$installer.Controls.Add($googleChrome)

#Kaspersky Internet Security 2017
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

#VLC Media Player
	$vlc.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$vlc.Size = $System_Drawing_Size
	$vlc.TabIndex = 4
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 261
	$vlc.Location = $System_Drawing_Point
	$vlc.DataBindings.DefaultDataSourceUpdateMode = 0
	$vlc.Name = "vlc"
	$vlc.Checked = 1
	$vlc.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\vlcMediaPlayer.ico")
	$installer.Controls.Add($vlc)

#7zip
	$7zip.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$7zip.Size = $System_Drawing_Size
	$7zip.TabIndex = 5
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 44
	$7zip.Location = $System_Drawing_Point
	$7zip.DataBindings.DefaultDataSourceUpdateMode = 0
	$7zip.Name = "7zip"
	$7zip.Checked = 1
	$7zip.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\7zip.ico")
	$installer.Controls.Add($7zip)

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
	$libreOffice.Checked = 0
	$libreOffice.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\libreOffice.ico")
	$installer.Controls.Add($libreOffice)

#TeamViewer
	$teamViewer.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$teamViewer.Size = $System_Drawing_Size
	$teamViewer.TabIndex = 7
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 230
	$teamViewer.Location = $System_Drawing_Point
	$teamViewer.DataBindings.DefaultDataSourceUpdateMode = 0
	$teamViewer.Name = "teamViewer"
	$teamViewer.Checked = 1
	$teamViewer.Image = [System.Drawing.Image]::FromFile("C:\Computer Repair Centre\teamViewer.ico")
	$installer.Controls.Add($teamViewer)

#Save the initial state of the form
	$InitialFormWindowState = $installer.WindowState
	$installer.add_Load($OnLoadForm_StateCorrection)

#Show the Form
	$installer.ShowDialog() | Out-Null
	}

#Call the Function
GenerateForm
