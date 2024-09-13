# wevon-teamspeak-installer

### Instaldor:

```sh
bash -c "$(wget -qLO - https://raw.githubusercontent.com/JashX/wevon-teamspeak-installer/main/el-instalador.sh)"
```



### Para actualizar:
```sh
sudo docker pull teamspeak
```



> [!WARNING]
> Para volver a ver tus claves porque se te olvido copiarlos:
> ```sh
> container_id=$(sudo docker ps -q --filter ancestor=teamspeak)
> sudo docker logs -f $container_id
> ```