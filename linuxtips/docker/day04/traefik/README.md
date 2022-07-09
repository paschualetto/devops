# Descomplicando Docker
## Day 04

### Traefik

* Proxy reverso

```bash
docker network create --driver=overlay traefik-public
touch traefik-deploy.yaml
docker stack deploy traefik -c traefik_deploy.yaml
docker service ls
docker service logs -f traefik_reverse-proxy
```