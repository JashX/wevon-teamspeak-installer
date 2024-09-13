# wevon-teamspeak-installer

### Instaldor:

```sh
bash -c "$(wget -qLO - https://raw.githubusercontent.com/JashX/wevon-teamspeak-installer/main/el-instalador.sh)"
```

> [!CAUTION]
> En caso de falla:
> ```sh
> container_id=$(sudo docker ps -q --filter ancestor=teamspeak)
> sudo docker logs -f $container_id
> ```