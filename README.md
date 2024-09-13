# wevon-teamspeak-installer



### Instaldor:
Para instalar el servidor de TeamSpeak usando Docker, ejecuta el siguiente comando:

```sh
bash -c "$(wget -qLO - https://raw.githubusercontent.com/JashX/wevon-teamspeak-installer/main/el-instalador.sh)"
```




## Para actualizar
Para actualizar el servidor de TeamSpeak, ejecuta el siguiente comando para obtener la última imagen de Docker:

```sh
sudo docker pull teamspeak
```




> [!WARNING]
> Para volver a ver tus claves, porque se te olvido copiarlas, ejecutar lo siguiente:
> ```sh
> container_id=$(sudo docker ps -q --filter ancestor=teamspeak)
> sudo docker logs -f $container_id
> ```