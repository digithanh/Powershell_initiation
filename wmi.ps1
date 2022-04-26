# WMI
# Vérifier que le service WMI fonctionne
get-service winmgmt
# Requête WMI sur le bios
Get-WmiObject -Class win32_bios
# Requête WMI pour visualiser les partitions logiques
Get-WmiObject -Class win32_logicaldisk | Format-Table
# Requête WMI pour avoir les informations système
Get-WmiObject -Class win32_computersystem
# Lister toutes les class WMI
Get-WmiObject -List | Out-File liste_wmi
# Lister la class CIM printer
Get-CimClass CIM_Printer
# Reuqête WMI sur les services pour avoir le spooler et sortir dans une liste les proprités voulues
Get-WmiObject  -Query "SELECT * FROM win32_service WHERE name='spooler'" -computername localhost | Format-List PSComputerName, Name, state , status
# Stocker dans une variable la requête WMI 
$monspool = Get-WmiObject  -Query "SELECT * FROM win32_service WHERE name='spooler'" -computername localhost
# Extraire les méthodes de la variable contenant la requête
$monspool | Get-Member -MemberType Method | Select-Object -Property Name
# Stoper le service spooler
$monspool.StopService()
# Demarer le service spooler
$monspool.StartService()

# Obtenir toutes les commandes CIM
Get-Command -Module CimCmdlets | Select-Object -Property Name
# Obtenir les informations du BIOS via CIM 
Get-CimInstance -ClassName Win32_BIOS
# Recherche tous les process qui commence par 'n' via CIM
Get-CimInstance -Query "SELECT * FROM win32_process WHERE name LIKE 'n%'"
# Même requête que la précédente différemment
Get-CimInstance -ClassName Win32_Process -Filter "name like 'n%'"
# Stocker dans une variable la requête CIM
$cimspool = Get-CimInstance -ComputerName localhost -Query "SELECT * FROM win32_service WHERE name='spooler'"
# Voir les méthodes de la variable contenant la requête CIM
$cimspool | Get-Member -MemberType Method