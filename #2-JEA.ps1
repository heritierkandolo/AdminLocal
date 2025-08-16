New-PSRoleCapabilityFile -Path "C:\Program Files\WindowsPowerShell\Modules\MyJEAModule\RoleCapabilities\HelpDeskRole.psrc"

# 1. Définir le fichier de configuration JEA
New-PSSessionConfigurationFile -Path 'C:\JEA\HelpDesk.pssc' `
    -SessionType RestrictedRemoteServer `
    -TranscriptDirectory 'C:\JEA\Transcripts' `
    -RunAsVirtualAccount `
    -RoleDefinitions @{ 'MyLab\HelpDeskGroup' = @{ RoleCapabilities = 'HelpDeskRole' } }


# 2. Enregistrer ce rôle JEA comme une configuration de session
Register-PSSessionConfiguration -Name 'HelpDesk' -Path 'C:\JEA\HelpDesk.pssc'

# 3. Vérifier la configuration
Get-PSSessionConfiguration | Where-Object Name -eq "HelpDesk"

# L’utilisateur ne peut exécuter QUE les commandes visibles dans VisibleCmdlets
Enter-PSSession -ComputerName "WIN11.mylab.local" -ConfigurationName "HelpDesk"