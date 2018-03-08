Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
$handler_restart_Click=
  {
    Restart-Computer -Force
  }
$Form = New-Object system.Windows.Forms.Form
$Form.ClientSize = '359,110'
$Form.text = "CRC Installer"
$Form.TopMost = $false
$restart = New-Object system.Windows.Forms.Button
$restart.text = "Restart"
$restart.width = 60
$restart.height = 30
$restart.location = New-Object System.Drawing.Point(147,58)
$restart.Font = 'Microsoft Sans Serif,10'
$restart.add_Click($handler_restart_Click)
$Label1 = New-Object system.Windows.Forms.Label
$Label1.text = "The installer has finished! The computer needs to restart"
$Label1.AutoSize = $true
$Label1.width = 25
$Label1.height = 10
$Label1.location = New-Object System.Drawing.Point(14,21)
$Label1.Font = 'Microsoft Sans Serif,10'
$Label2 = New-Object system.Windows.Forms.Label
$Label2.text = "in order to complete changes."
$Label2.AutoSize = $true
$Label2.width = 25
$Label2.height = 10
$Label2.location = New-Object System.Drawing.Point(99,36)
$Label2.Font = 'Microsoft Sans Serif,10'
$Form.controls.AddRange(@($restart,$Label1,$Label2))
[void]$Form.ShowDialog()
