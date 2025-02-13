# jellyfin-docker

1. Instalar podman
2. Montar la carpeta compartida en Windows en una unidad con letra
3. Si estas en windows entrar en el wsl de la maquina de podman que vas a utilizar

```
wsl
```

4. Montar la unidad compartida en el wsl

Ejemplo:
sudo mount -t drvfs Z: /mnt/z

```
sudo mount -t drvfs {LETRA}: /ruta/que/quieras
```

5. Ejecutar el compose

```
podman compose up -d
```

6. Entrar en el navegador en localhost: 8096