Get-PSDrive

Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\

Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ -Name DevicePath

New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ -Name PowerShellPath -PropertyType String -Value $PSHOME

Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ -Name PowerShellPath 