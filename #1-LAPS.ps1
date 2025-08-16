#Installer les outils LAPS (Windows 11 ou Server)
Add-WindowsCapability -Online -Name Rsat.LAPS.Tools~~~~0.0.1.0

#Importer le module PowerShell LAPS
Import-Module LAPS

#Mettre a jour le schema AD
Update-LapsADSchema -Verbose

#Activer LAPS sur un poste ou serveur
Set-LapsADComputerSelfPermission -Identity "OU=OU,DC=mylab,DC=local"

# Installé la nouvelle version d'Admx
#https://aka.ms/Windows11/24H2/ADMX

#Configuration GPO 

#Reset le mot de passe LAPS Local 
Reset-LapsPassword

#Récupérer le mot de passe local stocké dans Active Directory
Get-LapsADPassword -Identity "WIN11" -AsPlainText -IncludeHistory

#Lister tous les PCs avec mot de passe LAPS
Get-LapsADPassword -Identity (Get-ADComputer -Filter *).Name | Select-Object ComputerName,Password,ExpirationTimestamp

#Voir les permissions
Find-LapsADExtendedRights -Identity "OU=OU,DC=mylab,DC=local"

#Droit show Password PCs
Set-LapsADReadPasswordPermission -Identity "OU=OU,DC=mylab,DC=local" -AllowedPrincipals "MyLab\HelpDeskGroup"

#Rest Permission
Set-LapsADResetPasswordPermission -Identity "OU=OU,DC=mylab,DC=local" -AllowedPrincipals "MyLab\HelpDeskGroup"