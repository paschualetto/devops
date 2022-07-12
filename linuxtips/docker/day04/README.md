# Descomplicando Docker
## Day 04

### Docker Secrets

* Secrets ficam armazenadas em /run/secrets

```bash
echo -n "GIROPOPS STRIGUS GIRUS" | docker secret create jeferson -
docker secret ls
docker secret inspect jeferson
touch teste.txt

echo "GIROPOPS STRIGUS GIRUS" > teste.txt
docker secret create jeferson-arquivo teste.txt
docker secret ls
docker secret inspect jeferson-arquivo
docker secret rm jeferson

docker service create --name nginx --secret jeferson-arquivo -p 8080:80 nginx
docker service update --secret-add jeferson nginx

docker service create --name nginx2 --secret src=jeferson-arquivo,target=meu-secret,uid=200,gid=200,mode=0400 -p 8080:80 nginx
```

### Docker Compose

* Fazer deploy de serviços
* Dá pra manipular os serviços em cada nó usando labels
* Deploy mode global: um container em cada nó

```bash
docker stack deploy -c docker-compose.yml giropops
docker stack ls
docker stack ps giropops
docker stack services giropops
docker stack rm giropops

docker node update --label-add dc=UK elliot-01
```