# r3edge Primer React Template | ![Logo](logo_ds.png)

**Un template de démarrage pour React, suralimenté pour des déploiements multi-plateformes fluides.**

> 🚀 **Pourquoi utiliser ce template ?**
> 
> ✅ **Fondation Solide** : Basé sur le template officiel [Primer React](https://primer.style/react/) de GitHub.  
> ✅ **Développement Rapide** : Profitez de l'écosystème Vite pour une expérience de développement instantanée.  
> ✅ **Déploiement Universel** : Pré-configuré pour un déploiement en un clic sur Vercel, Netlify et GitHub Pages.  
> ✅ **Pipeline CICD moderne** : 1 commit déclenche 1 build et 1 deploy, 1 Pull Request génére des environnements de preview accessibles sur Netlify et sur Vercel.  
> ✅ **Environnement Conteneurisé** : Entièrement compatible avec GitHub Codespaces pour un environnement de développement reproductible.  
> ✅ **Qualité de Code** : Intègre ESLint et Prettier pour maintenir un code propre et cohérent.  

---

## 📋 Fonctionnalités clés

- ✅ **Stack Moderne** : React 19 + Vite.
- ✅ **UI Robuste** : Intégration complète du système de design [Primer React](https://primer.style/react/).
- ✅ **Routage Standard** : Utilise `react-router-dom` pour un contrôle total et une flexibilité maximale.
- ✅ **Déploiement Simplifié** : Fichiers de configuration `vercel.json` et `netlify.toml` inclus.
- ✅ **Workflow CI/CD** : Action GitHub prête à l'emploi pour construire et déployer sur GitHub Pages.
- ✅ **Environnement Isolé** : Configuration Devcontainer pour une expérience de développement cohérente dans VS Code et Codespaces.

---

## ⚙️ Démarrage Rapide

### Option 1 : GitHub Codespaces (Recommandé)

1.  Cliquez sur **Use this template** > **Open in a codespace**.
2.  Une fois le codespace initialisé, le terminal s'ouvrira. Les dépendances seront installées automatiquement.
3.  Le serveur de développement démarrera. Allez dans l'onglet **PORTS** et ouvrez l'URL publique pour voir votre application.

![Screenshot showing the ports tab and Port URL](.readme/image-ports-1.png)

### Option 2 : Développement Local

Vous devez avoir Node.js (version spécifiée dans `.nvmrc`) et Yarn installés sur votre machine.

1.  Clonez le dépôt sur votre machine locale :
    ```bash
    git clone https://github.com/VOTRE_USER/VOTRE_REPO.git
    cd VOTRE_REPO
    ```

2.  Installez les dépendances :
    ```bash
    npm install
    ```

3.  Lancez le serveur de développement :
    ```bash
    npm run dev
    ```

4.  Ouvrez votre navigateur et allez sur `http://localhost:1234`.

---

## 🔧 Configuration Post-Clonage

Pour que ce template fonctionne pleinement avec ses fonctionnalités de déploiement et de prévisualisation, une configuration initiale est requise après l'avoir cloné ou utilisé.

Ce guide vous explique les étapes cruciales à suivre.

### 1. Configuration de GitHub Pages (Crucial)

Ce template utilise une stratégie de déploiement sur une branche dédiée nommée `gh-pages`. C'est la méthode la plus robuste pour gérer à la fois un site de production et des environnements de prévisualisation temporaires pour les Pull Requests.

**Le concept de la branche `gh-pages` :**
-   Votre branche `main` contient le **code source** de votre application (React, JSX, etc.).
-   La branche `gh-pages` contient le **site web compilé et prêt à être servi** (fichiers HTML, CSS, JS purs).
-   Le workflow GitHub Actions se charge de compiler le code de `main` et de pousser le résultat sur `gh-pages` automatiquement.

**Actions requises :**

1.  Allez dans les paramètres de votre dépôt : `Settings` > `Pages`.
2.  Dans la section `Build and deployment`, sous `Source`, sélectionnez **`Deploy from a branch`**.
3.  Dans les menus déroulants qui apparaissent, configurez :
    -   **Branch** : `gh-pages`
    -   **Folder** : `/(root)`
4.  Cliquez sur **Save**.

Cette configuration unique indique à GitHub de servir le contenu de la branche `gh-pages` comme votre site web.

### 2. Configuration des Secrets pour les Workflows

Le workflow a besoin de secrets pour se connecter à des services externes comme Docker Hub.

1.  Allez dans les paramètres de votre dépôt : `Settings` > `Secrets and variables` > `Actions`.
2.  Cliquez sur `New repository secret` et ajoutez les secrets suivants :
    -   `DOCKERHUB_USERNAME` : Votre nom d'utilisateur Docker Hub.
    -   `DOCKERHUB_TOKEN` : Un [token d'accès personnel](https://hub.docker.com/settings/security) Docker Hub avec les permissions `Read & Write`.

Le secret `GITHUB_TOKEN` est fourni automatiquement par GitHub et n'a pas besoin d'être configuré.

### 3. Configuration pour Vercel et Netlify

Ce template est prêt à être déployé sur Vercel et Netlify.

1.  Créez un nouveau projet sur Vercel ou Netlify.
2.  Liez votre dépôt GitHub.
3.  Les plateformes détecteront automatiquement les fichiers de configuration (`vercel.json` ou `netlify.toml`) et appliqueront les bons paramètres de build (`npm run build`) et le bon dossier de sortie (`dist`).
4.  Ces plateformes gèrent nativement les prévisualisations de Pull Requests, vous n'avez rien de plus à configurer.

Une fois ces étapes terminées, votre dépôt cloné se comportera exactement comme le template original, avec des déploiements et des prévisualisations entièrement automatisés.

---

## 🚀 Plateformes de Déploiement

Cette section décrit les différentes manières de déployer l'application.

### Déploiements Automatisés (CI/CD)

Le workflow GitHub Actions de ce projet automatise entièrement le déploiement et la prévisualisation.

#### Prérequis pour l'automatisation

Pour que la publication automatique sur Docker Hub fonctionne, vous devez configurer les secrets suivants dans les paramètres de votre dépôt (`Settings > Secrets and variables > Actions`):
-   `DOCKERHUB_USERNAME`: Votre nom d'utilisateur Docker Hub.
-   `DOCKERHUB_TOKEN`: Un token d'accès personnel avec les permissions `Read & Write`.

#### Déclencheurs du Workflow

-   **Push sur `main`** : Déclenche le déploiement en production.
-   **Pull Request vers `main`** : Déclenche le déploiement d'un environnement de prévisualisation.

#### Actions en Production (sur `main`)

1.  **Déploiement sur GitHub Pages** : Le site est mis à jour sur sa branche principale.
    -   URL de production : [https://dsissoko.github.io/r3edge-primer-react/](https://dsissoko.github.io/r3edge-primer-react/)
2.  **Publication sur Docker Hub** : Une nouvelle image Docker `latest` est construite et poussée sur Docker Hub.

#### Prévisualisation des Pull Requests

-   Pour chaque Pull Request ouverte, une **version de prévisualisation** du site est automatiquement déployée sur une URL unique.
-   Le workflow poste un **commentaire dans la PR** avec un lien direct vers cet environnement, permettant une revue visuelle immédiate des changements.

#### Autres Plateformes

-   **Vercel** : Liez votre dépôt à un nouveau projet Vercel. La configuration `vercel.json` sera détectée automatiquement.
    -   URL de déploiement : [https://r3edge-primer-react.netlify.app/](https://r3edge-primer-react.netlify.app/)
-   **Netlify** : Liez votre dépôt à un nouveau site Netlify. La configuration `netlify.toml` sera détectée automatiquement.
    -   URL de déploiement : [https://r3edge-primer-react.netlify.app/](https://r3edge-primer-react.netlify.app/)

### Déploiement par Conteneur (Docker)

Cette sous-section décrit comment construire et exécuter l'application en tant que conteneur Docker.

#### Prérequis

1.  **Docker Desktop** : Assurez-vous que Docker est installé et en cours d'exécution sur votre machine.
2.  **Authentification Docker Hub** : Vous devez avoir un compte Docker Hub et être connecté via votre terminal.

#### Configuration Initiale (à faire une seule fois)

1.  **Créez votre fichier de configuration :**
    Copiez le fichier d'exemple `.env.example` pour créer votre propre configuration locale.
    ```bash
    cp docker/.env.example docker/.env
    ```
    Modifiez ensuite le fichier `docker/.env` pour y mettre votre nom d'utilisateur Docker Hub.

2.  **Connectez-vous à Docker Hub :**
    Exécutez cette commande et entrez votre nom d'utilisateur et votre **token d'accès personnel** (recommandé) lorsque vous y êtes invité.
    ```bash
    docker login
    ```

#### Build de l'Image

Le projet inclut un script pour simplifier le processus de build.

1.  **Rendez le script exécutable (si ce n'est pas déjà fait) :**
    ```bash
    chmod +x docker/build.sh
    ```

2.  **Lancez le script de build :**
    Ce script construira l'image et vous demandera si vous souhaitez la pousser sur Docker Hub.
    ```bash
    ./docker/build.sh
    ```

#### Lancement de Conteneur

Une fois l'image construite, vous pouvez la lancer localement.

1.  **Exécutez la commande `docker run` :**
    Cette commande démarre le conteneur, mappe le port 80 du conteneur au port 8080 de votre machine, et injecte une URL d'API backend.
    ```bash
    docker run -p 8080:80 \
      -e BACKEND_API_URL="https://votre-api.domaine.com/api" \
      votrenomdutilisateur/r3edge-primer-react:latest
    ```
    N'oubliez pas de remplacer `votrenomdutilisateur` par votre nom d'utilisateur Docker Hub.

2.  **Accédez à l'application :**
    Ouvrez votre navigateur et allez sur `http://localhost:8080`.

---

[![Dependabot Updates](https://github.com/dsissoko/r3edge-primer-react/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/dsissoko/r3edge-primer-react/actions/workflows/dependabot/dependabot-updates) [![Deploy](https://github.com/dsissoko/r3edge-primer-react/actions/workflows/deploy.yml/badge.svg)](https://github.com/dsissoko/r3edge-primer-react/actions/workflows/deploy.yml) [![Netlify Status](https://api.netlify.com/api/v1/badges/0425ea76-64ff-43bc-b478-ea228b042648/deploy-status)](https://app.netlify.com/projects/r3edge-primer-react/deploys)


📫 Maintenu par [@dsissoko](https://github.com/dsissoko) – Ce projet est une évolution du template officiel [Primer React](https://github.com/primer/react-template).