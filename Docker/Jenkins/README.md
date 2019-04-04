Create a volume
-----
```
docker volume create jenkins_home
```

Build the image
-----
```
docker build -t paschualetto/jenkins .
```

Run
-----
```
docker run -u root --rm -d -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean
```

Access
---
[Jenkins](http://localhost:8080)

Get the initial password
-----
```
docker container exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```