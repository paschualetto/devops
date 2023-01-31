# PostgreSQL Database on Kubernetes

## Usefull commands

```
kubectl exec -ti <pod_name> -- psql -U postgres -d postgres
```

## Database commands

```
CREATE DATABASE sonarqube;
CREATE USER sonarqube WITH PASSWORD 'ferfernando';
GRANT ALL PRIVILEGES ON DATABASE sonarqube TO sonarqube;
```