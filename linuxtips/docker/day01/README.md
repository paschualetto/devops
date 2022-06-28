# Descomplicando Docker
## Day 01

### O que são containers?

* Não são Vm's
* Isolamento lógico de processos (namespaces)
* Isolamento físico de cpu, memória, i/o (cgroups)
* Docker surgiu a partir do LXC
* Criado por Solomon Hykes

### Copy on write

* Cada instrução gera uma nova camada na imagem docker
* Somente a última camada permite escrita, as outras são readOnly
* Se precisar alterar uma das camadas RO, o docker cria uma cópia dessa camada e coloca no topo das camadas
* Isso acontece para manter a imagem inicial intacta e que os containers sejam gerados sempre iguais
* Uma instrução que tente remover dados de instruções anteriores aparenta sucesso mas o espaço em disco alocado pelas anteriores continuará em uso

### Namespaces, cgroups e Netfilter

* Containers utilizam o kernel linux da máquina host
* Regras de rede no docker são feitas por iptables/netfilter
* Namespaces para isolamento lógico de processos
* Cgroups (google) para isolamento de hardware

### Instalando o docker

* docs.docker.com
* EE (Enterprise Edition, paga) e CE (Community Edition, gratuita)

```bash
curl -fsSl https://get.docker.com | bash
```

* Docker client: comandos para manipular
* Docker server: gerenciador de containers (daemon)

Remover necessidade de sudo ao rodar comandos docker:
```bash
sudo usermod -aG docker <your_user>
```

### Primeiros passos

* Remodelagem dos comandos
* Docker client interage com o docker server
* Pull da imagem caso não exista
* Se o processo atrelado ao entrypoint termina, o container morre
* Ctrl + p + q para sair do container
* RUN roda na criação da imagem, CMD somente quando o container entra em execução

```bash
docker version
docker container ls
docker ps
docker container run -ti hello-world
docker container ls -a
docker container run -ti ubuntu
docker container run -ti centos
docker container exec -ti <container_id> <command>
docker container stop <container_id>
docker container start <container_id>
docker container restart <container_id>
docker container inspect <container_id>
docker container pause <container_id>
docker container unpause <container_id>
docker container logs -f <container_id>
docker container attach <container_id>
docker container rm <container_id>
docker container rm -f <container_id>
docker container stats <container_id>
docker container top <container_id>
stress --cpu 1 --vm-bytes 128M --vm 1
docker container run -d -m 128M nginx
docker container run -d -m 128M --cpus 0.5 nginx
docker container update --cpus 0.2 <container_id>
docker container update --cpus 0.8 --memory 64M <container_id>
docker image build -t toskeira:1.0.0 .
```