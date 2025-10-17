# TeleDx - Plateforme de Télé-Expertise Médicale

## 📋 Table des matières
- [Description du Projet](#-description-du-projet)
- [Fonctionnalités](#-fonctionnalités)
- [Technologies Utilisées](#-technologies-utilisées)
- [Installation](#-installation)
- [Structure du Projet](#-structure-du-projet)
- [Processus du Workflow](#-processus-du-workflow)
- [Modules Principaux](#-modules-principaux)
- [API Endpoints](#-api-endpoints)
- [Tests](#-tests)
- [Contribution](#-contribution)
- [Licence](#-licence)

## 🏥 Description du Projet
TeleDx est une plateforme de télé-expertise médicale conçue pour optimiser le parcours patient en facilitant la coordination entre médecins généralistes et spécialistes. Le système permet une prise en charge médicale efficace et rapide grâce à la collaboration à distance entre professionnels de santé.

## ✨ Fonctionnalités

### Module d'Authentification
- Connexion/Déconnexion sécurisée
- Gestion des rôles : Médecin Généraliste, Spécialiste et Infirmier

### Module Infirmier
- Enregistrement des nouveaux patients
- Mise à jour des dossiers patients existants
- Gestion des signes vitaux
- Gestion de la file d'attente des patients
- Visualisation des patients enregistrés avec leurs informations essentielles

### Module Médecin Généraliste
- Création et gestion des consultations
- Demande d'expertise spécialisée
- Visualisation du coût total des soins
- Gestion du dossier médical du patient

### Module Spécialiste
- Configuration du profil (tarifs, spécialité, disponibilités)
- Gestion des créneaux de consultation
- Traitement des demandes d'expertise
- Rédaction et envoi d'avis médicaux

## 🛠 Technologies Utilisées

### Backend
- **Java 17+**
- **Maven** - Gestion des dépendances
- **Hibernate/JPA** - ORM pour la persistance des données
- **Jakarta EE** - Pour les services web
- **JUnit 5** & **Mockito** - Pour les tests unitaires
- **BCrypt** - Pour le hachage des mots de passe

### Frontend
- **JSP** - Templates de vues
- **tailwindCss** - Framework CSS
- **JavaScript** - Interactivité côté client
- **AJAX** - Appels asynchrones

### Base de Données
- **PostgreSQL** - Base de données relationnelle

## 🚀 Installation

### Prérequis
- JDK 17 ou supérieur
- Maven 3.8+
- Serveur d'applications compatible Java EE (Tomcat, etc.)
### Configuration
1. Cloner le dépôt :
   ```bash
   git clone https://github.com/anwar-elbarry/TeleDx.git
   cd TeleDx
   ```

2. Configurer la base de données :
   - Créer une base de données nommée `teledx_db`
   - Mettre à jour les paramètres de connexion dans `src/main/resources/META-INF/persistence.xml`

3. Compiler le projet :
   ```bash
   mvn clean install
   ```

4. Déployer l'application sur votre serveur d'applications

5. Accéder à l'application :
   ```
   http://localhost:8080/TeleDx
   ```

## 📁 Structure du Projet
```
src/
├── main/
│   ├── java/
│   │   └── com/teleDx/
│   │       ├── controller/     # Contrôleurs MVC
│   │       ├── service/        # Couche métier
│   │       ├── dao/            # Accès aux données
│   │       ├── entity/         # Entités JPA
│   │       └── util/           # Utilitaires
│   ├── resources/             
│   │   └── META-INF/          
│   │       └── persistence.xml # Configuration JPA
│   └── webapp/                
│       ├── WEB-INF/           
│       │   └── views/         # Vues JSP
│       └── resources/         # Fichiers statiques (CSS, JS, images)
└── test/
    └── java/                  # Tests unitaires et d'intégration
```

## 🔄 Processus du Workflow

1. **Arrivée et enregistrement du patient**
   - Saisie des données administratives et médicales
   - Mesure des signes vitaux
   
2. **File d'attente**
   - Intégration automatique dans la file d'attente
   
3. **Consultation avec le médecin généraliste**
   - Examen clinique
   - Analyse des symptômes
   - Décision de prise en charge

4. **Décision de prise en charge**
   - **Prise en charge directe** (diagnostic et prescription)
   - **Demande de télé-expertise** (si nécessaire)

5. **Télé-expertise**
   - Sélection du spécialiste
   - Prise de rendez-vous
   - Échange d'informations
   - Avis spécialisé

## 📊 Modules Principaux

### Gestion des Patients
- Création et mise à jour des dossiers patients
- Gestion des antécédents médicaux
- Suivi des consultations

### Gestion des Rendez-vous
- Prise de rendez-vous en ligne
- Gestion des disponibilités
- Rappels automatiques

### Télé-Expertise
- Demande d'avis spécialisé
- Partage sécurisé des données médicales
- Communication médecin-spécialiste

### Facturation
- Gestion des tarifs
- Génération de factures
- Suivi des paiements

## 🔌 API Endpoints (Exemples)

### Authentification
- `POST /api/auth/login` - Connexion utilisateur
- `POST /api/auth/logout` - Déconnexion

### Patients
- `GET /api/patients` - Liste des patients
- `POST /api/patients` - Créer un patient
- `GET /api/patients/{id}` - Détails d'un patient
- `PUT /api/patients/{id}` - Mettre à jour un patient

### Consultations
- `POST /api/consultations` - Créer une consultation
- `GET /api/consultations/{id}` - Détails d'une consultation
- `POST /api/consultations/{id}/expertise` - Demander une expertise

## 🧪 Tests

### Exécution des tests
```bash
mvn test
```

### Couverture de test
Le projet inclut des tests unitaires et d'intégration pour assurer la qualité du code.

## 🤝 Contribution
Les contributions sont les bienvenues ! Voici comment participer :

1. Fork le projet
2. Créez votre branche (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Poussez vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## 📄 Licence
Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de détails.

---

<div align="center">
  <h3>🚀 Développé avec passion par Anouar El barry 🚀</h3>
  <p>Pour une meilleure santé, ensemble.</p>
</div>