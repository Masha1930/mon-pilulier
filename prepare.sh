#!/usr/bin/env bash
# Prépare le projet Android (utilisé par GitHub Actions, ou à lancer à la main)
set -euo pipefail
npm install
[ -d android ] || npx cap add android
npx cap sync android
M=android/app/src/main/AndroidManifest.xml
if ! grep -q "android.permission.CAMERA" "$M"; then
  sed -i 's#</manifest>#    <uses-permission android:name="android.permission.CAMERA" />\n    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />\n    <uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />\n    <uses-feature android:name="android.hardware.camera" android:required="false" />\n</manifest>#' "$M"
fi
cp -r resources/res/. android/app/src/main/res/
# les icônes WebP du modèle prennent le pas sur nos PNG : on les supprime
find android/app/src/main/res -name 'ic_launcher*.webp' -delete
echo "Projet Android prêt."
