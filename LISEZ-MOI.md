# Mon pilulier : version Android

Ce dossier contient tout ce qu’il faut pour fabriquer le fichier **mon-pilulier.apk**, installable sur un téléphone Android. La fabrication se fait gratuitement sur GitHub, sans rien installer sur votre ordinateur.

## Fabriquer l’APK (environ 10 minutes, une seule fois)

1. Créez un compte gratuit sur https://github.com si vous n’en avez pas.
2. Cliquez sur **+ → New repository**. Nommez-le `mon-pilulier`, choisissez **Private** (privé), puis **Create repository**.
3. Décompressez cette archive sur votre ordinateur.
4. Sur la page du dépôt, cliquez sur **uploading an existing file**, puis glissez-déposez **tout le contenu** du dossier décompressé (y compris le dossier caché `.github`). Cliquez sur **Commit changes**.
   - Si le dossier `.github` n’est pas pris en compte, ajoutez-le à la main : **Add file → Create new file**, tapez le nom `.github/workflows/build-apk.yml` et collez-y le contenu du fichier du même nom.
5. Ouvrez l’onglet **Actions**. Une construction « Construire l’APK » démarre toute seule (sinon : cliquez dessus, puis **Run workflow**). Elle dure 5 à 10 minutes.
6. Quand la coche verte apparaît, cliquez sur la construction, puis téléchargez **mon-pilulier-apk** tout en bas (dans « Artifacts »). Décompressez : vous obtenez `app-debug.apk`.

## Installer sur le téléphone

1. Envoyez `app-debug.apk` sur le téléphone (câble USB, mail, Drive…).
2. Ouvrez-le. Android demande d’autoriser l’installation depuis cette source : acceptez. Un message de Play Protect peut apparaître : c’est normal pour une appli qui ne vient pas du Play Store, choisissez « Installer quand même ».
3. Au premier lancement, autorisez les **notifications** (rappels) et l’**appareil photo**.

## Ce qui change par rapport à la version web

- Les rappels sonnent même quand l’appli est fermée. Ils sont reprogrammés à chaque ouverture et à chaque modification, pour les 14 prochains jours.
- Le bouton « Lire l’ordonnance automatiquement » n’existe pas dans l’APK : il faut saisir les médicaments à la main.
- Le bouton « Exporter » ouvre le partage Android (message, mail, WhatsApp…) avec le texte du pilulier de la semaine.
- La lecture d’un PDF a besoin d’une connexion internet.
- Les données restent sur le téléphone. Désinstaller l’appli les efface.

## Mettre à jour l’appli

Remplacez `www/index.html` dans le dépôt GitHub, puis relancez la construction (onglet Actions → Run workflow).

## En cas d’échec de la construction

Ouvrez la construction en rouge, copiez le message d’erreur et envoyez-le à Claude : le plus souvent, c’est une correction d’une ligne.
