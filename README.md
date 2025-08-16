# 🛡️ Zéro Admin Local Permanent avec PowerShell – AD

Ce projet propose une démonstration concrète de la mise en place de **LAPS**, **Just-In-Time (JIT)** et **Just-Enough Administration (JEA)** dans un environnement Active Directory, afin de supprimer les droits administrateurs locaux permanents.

🎥 **Démo vidéo disponible ici** → [![Voir la démo sur YouTube](https://img.youtube.com/vi/ID_VIDEO_YOUTUBE/0.jpg)](https://youtube.com/watch?v=ID_VIDEO_YOUTUBE)


## 📌 Objectif

Mettre en œuvre une approche **Zero Trust** en entreprise pour :
- Supprimer les comptes administrateurs locaux permanents
- Réduire les privilèges au strict nécessaire (principe de moindre privilège)
- Fournir un accès temporaire contrôlé et traçable

## 🎯 Problèmes adressés

- 🔐 Mot de passe admin local identique sur plusieurs machines
- ⏳ Droits administrateurs attribués de façon permanente
- ⚠️ Privilèges excessifs pour des tâches ponctuelles

## 🛠️ Technologies utilisées

- PowerShell 5.1+
- Active Directory
- Windows LAPS
- SessionConfiguration JEA
- Scripts d’automatisation

---

## 📁 Contenu du projet

### `#1-LAPS.ps1` – Mise en place de LAPS

- Installation du module LAPS
- Attribution des permissions AD
- Visualisation du mot de passe stocké dans l’attribut AD sécurisé
- Export du rapport des mots de passe par machine6+696

📌 **Objectif** : assurer une rotation automatique et unique des mots de passe locaux.

---

### `#2-JEA.ps1` – Configuration Just Enough Administration

- Création d’un fichier `.pssc` avec des cmdlets autorisées
- Enregistrement d’une session PowerShell restreinte
- Exemple d'utilisation avec `Enter-PSSession`

📌 **Objectif** : donner uniquement les droits nécessaires à l’utilisateur pour exécuter des tâches précises.

---

### `#3-JIT.ps1` – Script d’élévation temporaire

- Ajout***** d’un utilisateur au groupe Administrateurs locaux
- Minuterie pour suppression automatique après une durée définie (ex. 1h)
- Journalisation de la session (option Start-Transcript)

📌 **Objectif** : fournir un accès administrateur temporaire, automatiquement révoqué.

---

## ✅ Résultat attendu

- Suppression des droits admin permanents
- Traçabilité complète des actions PowerShell
- Conformité aux bonnes pratiques de cybersécurité (Zero Trust, Moindre Privilège)
dcxv 
---

## 📄 Auteur

**Héritier KANDOLO**  
Microsoft Certified Trainer | IT Infrastructure & Automation Expert
Contact : [LinkedIn]([https://www.linkedin.com/](https://www.linkedin.com/in/h%C3%A9ritier-kandolo-itil%C2%AE-21190a7b/)

