# Usar la imagen oficial de Jellyfin
FROM jellyfin/jellyfin:latest

# Instalar las herramientas necesarias para montar CIFS y envsubst
RUN apt-get update && apt-get install -y \
    cifs-utils \
    gettext-base \
    && rm -rf /var/lib/apt/lists/*

# Verificar que las variables de entorno están disponibles
RUN echo "NAS_MOUNT_POINT is set to: ${NAS_MOUNT_POINT}"

# Definir el punto de entrada para el contenedor con envsubst
ENTRYPOINT ["sh", "-c", "echo 'Mount point: ${NAS_MOUNT_POINT}' && mkdir -p $(echo ${NAS_MOUNT_POINT}) && mount -t cifs -o username=${NAS_USER},password=${NAS_PASSWORD},uid=1000,gid=1000 //${NAS_IP}/${NAS_SHARE} ${NAS_MOUNT_POINT} && exec /usr/local/bin/jellyfin"]
