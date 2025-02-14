FROM jellyfin/jellyfin:latest

# Instalar herramientas necesarias para montar CIFS
RUN apt-get update && apt-get install -y cifs-utils iputils-ping && rm -rf /var/lib/apt/lists/*

# Copiar el script de inicio
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Usar el script como entrypoint
ENTRYPOINT ["/entrypoint.sh"]
