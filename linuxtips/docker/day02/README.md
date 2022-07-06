# Descomplicando Docker
## Day 02

### Volumes e Imagens

* Volumes para preservar os dados dos containers
* Filesystem dentro do container
* Dois tipos de volumes no docker: bind e volume
* Bind é quando já temos o diretório que será montado no container
* Deve-se sempre especificar o tipo
* Caso tenha informado volume no Dockerfile, se não for especificado no run, o tipo padrão é volume
* Volumes não gerenciados pelo usuário, são criados com nomes aleatórios
* Todo volume docker vai estar em /var/lib/docker/volumes
* Podemos utilizar o mesmo volume para vários containers
* Docker container create cria o container mas ele não entra em execução

```bash
mkdir /tmp/giropops
docker container run -ti --mount type=bind,src=/tmp/giropops,dst=/giropops debian
docker container run -ti --mount type=bind,src=/tmp/giropops,dst=/giropops,ro debian

docker volume create giropops
docker volume ls
docker volume inspect giropops
cd /var/lib/docker/volumes/giropops/_data
docker container run -ti --mount type=volume,src=giropops,dst=/giropops debian
docker volume rm giropops
docker volume prune
docker container prune
docker container create -v /tmp/giropops:/data --name dbdados centos
docker container run -d -p 5432:5432 --name pgsql1 --volumes-from dbdados -e POSTGRESQL_USER=docker -e POSTGRESQL_PASS=docker -e POSTGRESQL_DB=docker kamui/postgresql
docker container run -d -p 5433:5432 --name pgsql2 --volumes-from dbdados -e POSTGRESQL_USER=docker -e POSTGRESQL_PASS=docker -e POSTGRESQL_DB=docker kamui/postgresql

docker volume create dbdados
docker container run -d -p 5434:5432 --name pgsql3 --mount type=volume,src=dbdados,dst=/data -e POSTGRESQL_USER=docker -e POSTGRESQL_PASS=docker -e POSTGRESQL_DB=docker kamui/postgresql
docker container run -d -p 5435:5432 --name pgsql4 --mount type=volume,src=dbdados,dst=/data -e POSTGRESQL_USER=docker -e POSTGRESQL_PASS=docker -e POSTGRESQL_DB=docker kamui/postgresql

mkdir /tmp/backup
docker container run -ti --mount type=volume,src=dbdados,dst=/data --mount type=bind,src=/tmp/backup,dst=/backup debian tar -cvf /backup/bkp-db.tar /data
```

### Criar e gerenciar Imagens Docker

* Uma imagem é, praticamente, um container parado, que não está em execução
* Imagens dão a possibildiade da existência de containers, todos eles são baseados em uma imagem
* O ideal é sempre ter as próprias imagens para evitar vulnerabilidades
* Alpine é uma distro pequena com o mínimo necessário para começar a criar imagens
* Entrypoint é o principal processo do container, se esse morre, o container morre junto
* CMD passa parâmetros para o principal processo do container
* Havendo entrypoint e cmd no mesmo dockerfile, é obrigatório usar o modo exec
* Copy e Add são usados para copiar arquivos para dentro do container
* Add pode resolver arquivos remotos e descompactar arquivos tar no destino no momento da cópia

```bash
cd dockerfiles/1
docker image build -t my_apache:1.0.0 .

cd dockerfiles/2
docker image build -t my_apache:2.0.0 .
docker image build -t my_apache:2.0.0 . --no-cache

cd dockerfiles/3
docker image build -t my_apache:3.0.0 . --no-cache
docker container run -d -p 8080:80 my_apache:3.0.0

cd dockerfiles/4
go mod init example/hello
docker image build -t mygo:1.0 .

cd dockerfiles/5
go mod init example/hello
docker image build -t mygo:2.0 .

docker container run -it --name ubuntu ubuntu
apt-get update && apt-get install -y vim git
ctrl + p + q
docker commit -m "Ubuntu com vim e git" ubuntu
docker image tag <image_id> ubuntu_vim_git:1.0.0
docker container run -it ubuntu_vim_git:1.0.0
docker login
docker push

docker container run -d -p 5000:5000 --restart=always --name registry registry:2
docker image tag <image_id> localhost:5000/ubuntu_vim_git:1.0.0
docker push localhost:5000/ubuntu_vim_git:1.0.0
```