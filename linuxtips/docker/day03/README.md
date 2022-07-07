# Descomplicando Docker
## Day 03

### Docker Swarm

* Orquestrador de containers
* Ambiente seguro, HA, balanceamento de carga
* Built-in no docker
* Manager (conhece detalhes sensíveis do cluster, administração) e worker (containers em execução)
* Manager pode executar containers também
* 51% de managers funcionando (número ímpar é melhor)
* Se um manager cai, o cluster elege o próximo lider
* Quanto mais managers, mais tempo leva pra eleger o líder
* Indicar a interface de rede se houver mais de uma
* O service publica a porta do serviço em todos os nós

```bash
docker swarm --help
docker swarm init (--advertise-addr <ip_interface_rede>)
docker node ls
docker node promote <hostname>
docker node demote <hostname>
docker swarm join-token worker
docker swarm join-token manager
docker node remove -f <hostname>
docker swarm join-token --help
docker swarm join-token --rotate manager

docker service create --name webserver --replicas 3 -p 8080:80 nginx
docker service ps webserver
docker node update --availability pause swarm-server-02 (drain, pause e active)
docker node inspect swarm-server-02
docker service scale webserver=10
docker service rm webserver

docker service create --name giropops --replicas 3 -p 8080:80 nginx
docker service ls
docker service ps giropops
docker service inspect giropops --pretty
docker service scale giropops=10
docker service logs -f giropops
docker service rm giropops

docker volume create giropops
docker service create --name giropops --replicas 3 -p 8080:80 --mount type=volume,src=giropops,dst=/usr/share/nginx/html nginx
```