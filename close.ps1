Remove-Item "C:\Computer Repair Centre\*.gif" -Force
Remove-Item "C:\Computer Repair Centre\*.ico" -Force
Remove-Item "C:\Computer Repair Centre\main.ps1" -Force
Remove-Item "C:\Computer Repair Centre\*.nupkg" -Force
Remove-Item "C:\Computer Repair Centre\*.exe" -Force
Remove-Item "C:\Computer Repair Centre\*.zip" -Force
taskkill /f /IM explorer.exe
Start-Sleep -s 2
start explorer.exe
exit
