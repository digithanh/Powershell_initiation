# Filter les services en état running, afficher le nom et le détail ou le mot sécurité est contenu
Get-Service | Where-Object {$_.Status -eq "running"} | Select-Object Name, DisplayName | Where-Object {$_.DisplayName -match "sécurité"}

# Avoir le chemin de l'executable de chaque service
Get-WmiObject win32_service | Format-Table -Wrap -AutoSize -Property State,Name,PathName 