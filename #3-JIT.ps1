# 1. Variables de base
$User = "mylab\client"
$Group = "Administrateurs"
$Duree = 3600   # Durée en secondes (ici 1h)

# 2. Ajout temporaire de l’utilisateur au groupe Administrateurs
Add-LocalGroupMember -Group $Group -Member $User
Write-Host "[$(Get-Date)] $User ajouté temporairement au groupe $Group."

# 3. Attente de la durée définie
Start-Sleep -Seconds $Duree

# 4. Retrait automatique de l’utilisateur
Remove-LocalGroupMember -Group $Group -Member $User
Write-Host "[$(Get-Date)] $User retiré du groupe $Group."

# Activer un log d’audit de la session
Start-Transcript -Path "C:\Logs\JIT_AdminSession_$(Get-Date -Format yyyyMMdd_HHmm).log"


Add-ADGroupMember -Identity "Administrateurs du domaine" -Members "User1"
Start-Job -ScriptBlock {
    Start-Sleep -Seconds 1800
    Remove-ADGroupMember -Identity "Administrateurs du domaine" -Members "User1" -Confirm:$false
}
