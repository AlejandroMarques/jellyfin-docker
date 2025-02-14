#!/bin/sh

echo "Mount point: $NAS_MOUNT_POINT"

mkdir -p "$NAS_MOUNT_POINT"
if [ $? -ne 0 ]; then
    echo "❌ Error: No se pudo crear el directorio $NAS_MOUNT_POINT"
    exit 1
fi

echo "Intentando montar CIFS en $NAS_MOUNT_POINT..."
mount -t cifs -o username=$NAS_USER,password="$NAS_PASSWORD",vers=2.0 //${NAS_IP}/${NAS_SHARE} "$NAS_MOUNT_POINT"
if [ $? -ne 0 ]; then
    echo "❌ Error: No se pudo montar CIFS en $NAS_MOUNT_POINT"
    exit 1
fi

echo "✅ Montaje CIFS exitoso."

# Iniciar Jellyfin
exec /jellyfin/jellyfin
