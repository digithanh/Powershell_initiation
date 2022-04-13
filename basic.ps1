#Créer un répertoire
New-Item -ItemType Directory "MonRepertoire" 2>&1 >> .\basic.log
#Si le répertoire existe faire les actions suivantes
if ( $? ) {
  #Créer un fichier dans le répertoire 
  New-Item -Path .\MonRepertoire -Name "MonFichier.txt" 2>&1 >> .\basic.log
  #Ecrire dans le fichier
  Write-Output "toto" > .\MonRepertoire\MonFichier.txt
  #Lire contenu du fichier 
  Get-Content .\MonRepertoire\MonFichier.txt
}
#Sinon supprimer le répertoire existant et les logs
else {
  Remove-Item .\MonRepertoire -Recurse -Force
  Get-Item .\basic.log
  if ( $? ) {
    Remove-Item .\basic.log
  }
}
