# WSO2 API Manager Docker Artifacts Customized by kiosanim and memorais for POC purposes

The Goal of this work is to customize pattern-3 to be used in parameterized way in a kubernetes + docker environment

## Getting Started

```bash
git clone https://github.com/memorais/docker-apim.git
```

## Environments used in runtime

- **ARG MY_JDBC_URL:** JDBC URL
- **ARG MY_JDBCDRIVER:** JDBC Driver, ex: ***com.mysql.jdbc.Driver***
- **ARG MY_USER:** DB User
- **ARG MY_PWD:** DB Password
- **ARG SVN_REPO_URL:** SVN Repository URL, ex: http://svnrepo.example.com/repos/
- **ARG SVN_REPO_USER:** SVN Repository User
- **ARG SVN_REPO_PWD:** SVN Repository Password

## The building / running order

- **svnrepo:**
  You should download this image from wso2.com
  Don't forget to expose port 80 if you're running in a single docker/machine, for testing

- **mysql:**
  You should run this image with **MYSQL_ROOT_PASSWORD** environment parameter
  Don't forget to expose port 3306 if you're running in a single docker/machine, for testing

  ```bash
  docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --name wso2mysql wso2/mysqldb
```

- **analytics:**
  You should run this image using the environment parameters;
  Don't forget to do the port mapping 9448:9444

  ```bash
  docker run -d -p 9443:9443 -e MY_URL=jdbc:mysql://HOST_BD:3306/stats_db?autoReconnect=true -e MY_JDBCDRIVER=com.mysql.jdbc.Driver -e MY_USER=root -e MY_PWD=root -e SVN_REPO_URL=http://HOST_SVN/repos/ -e SVN_REPO_USER=root -e SVN_REPO_PWD=root   --link wso2mysql -i -t docker.wso2.com/am-analytics
```
- **traffic-manager:**
  Don't forget to do the port mapping 9447:9443
```bash
docker run -d -p 9447:9443 -e MY_URL_APIDB=jdbc:mysql://HOST_BD:3306/apimgtdb?autoReconnect=true -e MY_URL_USERSDB=jdbc:mysql://HOST_BD:3306/usersdb?autoReconnect=true -e MY_URL_REGDB=jdbc:mysql://HOST_BD:3306/regdb?autoReconnect=true -e MY_JDBCDRIVER=com.mysql.jdbc.Driver -e MY_USER=root -e MY_PWD=root -e SVN_REPO_URL=http://HOSTNAME/repos/ -e SVN_REPO_USER=root -e SVN_REPO_PWD=root   --name traffic-manager --link wso2mysql -i -t docker.wso2.com/traffic-manager
```


- **key-manager:**

```bash
docker run -d -p 9447:9443 -e MY_URL_APIDB=jdbc:mysql://HOST_BD:3306/apimgtdb?autoReconnect=true -e MY_URL_USERSDB=jdbc:mysql://HOST_BD:3306/usersdb?autoReconnect=true -e MY_URL_REGDB=jdbc:mysql://HOST_BD:3306/regdb?autoReconnect=true -e MY_JDBCDRIVER=com.mysql.jdbc.Driver -e MY_USER=root -e MY_PWD=root -e SVN_REPO_URL=http://HOSTNAME/repos/ -e SVN_REPO_USER=root -e SVN_REPO_PWD=root   --name traffic-manager --link wso2mysql -i -t docker.wso2.com/keymanager
```



- **gateway-manager:**

- **gateway-worker:**

- **store:**

- **publisher:**





This repository contains following Docker artifacts:
- WSO2 API Manager Dockerfile
- WSO2 API Manager Docker Compose File

## Getting Started

Execute following command to clone the repository:

```bash
git clone https://github.com/wso2/docker-apim.git
```

Checkout required product version branch:

```bash
git branch
git checkout <product-version>
```

The bash files in dockerfile folder make use of scripts in [wso2/docker-common](https://github.com/wso2/docker-common) repository
and it has been imported into dockerfile/common folder as a sub-module. Once the clone process is completed execute following
commands to pull the sub-module content:

```bash
git submodule init
git submodule update
```
