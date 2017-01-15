# WSO2 API Manager Docker Artifacts Customized by kiosanim and memorais for POC purposes

The Goal of this work is to customize pattern-3 to be used in parameterized way in a kubernetes + docker environment

## Getting Started

```bash
git clone https://github.com/memorais/docker-apim.git
```

## Environments used in runtime

- **MY_JDBC_URL:** JDBC URL (for images ugins only one db)
- **MY_URL_APIDB:** JDBC URL For apimgtdb
- **MY_URL_USERSDB:** JDBC URL for userdb
- **MY_URL_REGDB:** JDBC URL for regdb
- **MY_URL_STATDB:** JDBC URL for stats_db
- **MY_JDBCDRIVER:** JDBC Driver, ex: ***com.mysql.jdbc.Driver***
- **MY_USER:** DB User
- **MY_PWD:** DB Password
- **SVN_REPO_URL:** SVN Repository URL, ex: http://svnrepo.example.com/repos/
- **SVN_REPO_USER:** SVN Repository User
- **SVN_REPO_PWD:** SVN Repository Password
- **TRAFFIC_MANAGER_URI:** Traffic Manager TCP URI, ex: tcp://HOST_TRAFFIC_MANAGER:5672

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
  docker run -d -p 9448:9444 -e MY_URL=jdbc:mysql://HOST_BD:3306/stats_db?autoReconnect=true -e MY_JDBCDRIVER=com.mysql.jdbc.Driver -e MY_USER=root -e MY_PWD=root -e SVN_REPO_URL=http://HOST_SVN/repos/ -e SVN_REPO_USER=user -e SVN_REPO_PWD=password -i -t docker.wso2.com/am-analytics
```
- **traffic-manager:**
  Don't forget to do the port mapping 9447:9443
```bash
docker run -d -p 9447:9443 -e MY_URL_APIDB=jdbc:mysql://HOST_BD:3306/apimgtdb?autoReconnect=true -e MY_URL_USERSDB=jdbc:mysql://HOST_BD:3306/userdb?autoReconnect=true -e MY_URL_REGDB=jdbc:mysql://HOST_BD:3306/regdb?autoReconnect=true -e MY_JDBCDRIVER=com.mysql.jdbc.Driver -e MY_USER=root -e MY_PWD=root -e SVN_REPO_URL=http://HOSTNAME/repos/ -e SVN_REPO_USER=user -e SVN_REPO_PWD=password   --name traffic-manager  -i -t docker.wso2.com/traffic-manager
```

- **key-manager:**
  Don't forget to do the port mapping 9443:9443
```bash
docker run -d -p 9443:9443 -e MY_URL_APIDB=jdbc:mysql://HOST_BD:3306/apimgtdb?autoReconnect=true -e MY_URL_USERSDB=jdbc:mysql://HOST_BD:3306/userdb?autoReconnect=true -e MY_URL_REGDB=jdbc:mysql://HOST_BD:3306/regdb?autoReconnect=true -e MY_JDBCDRIVER=com.mysql.jdbc.Driver -e MY_USER=root -e MY_PWD=root -e SVN_REPO_URL=http://HOSTNAME/repos/ -e SVN_REPO_USER=user -e SVN_REPO_PWD=password -e ANALYTICS_URL=tcp://HOST_ANALYTICS:7612 -e ANALYTICS_SSL_URL=ssl://HOST_ANALYTICS:7712 -e ANALYTICS_USER=admin -e ANALYTICS_PWD=admin -e ANALYTICS_REST_URL=https://HOST_ANALYTICS:9444 -e ANALYTICS_REST_USER=admin -e ANALYTICS_REST_PWD=admin -e GW_MANAGER_URL=https://GW_MANAGER:9443/services -e GW_ENDPOINT=http://GE_WORKER:8280,https://GW_WORKER:8243  --name keymanager -i -t docker.wso2.com/keymanager
```

- **gateway-manager:**
  Don't forget to do the port mapping 9444:9443
```bash
docker run -d -p 9444:9443 -e MY_URL_APIDB=jdbc:mysql://HOST_BD:3306/apimgtdb?autoReconnect=true -e MY_URL_USERSDB=jdbc:mysql://HOST_BD:3306/userdb?autoReconnect=true -e MY_URL_REGDB=jdbc:mysql://HOST_BD:3306/regdb?autoReconnect=true -e MY_JDBCDRIVER=com.mysql.jdbc.Driver -e MY_USER=root -e MY_PWD=root -e SVN_REPO_URL=http://HOSTNAME/repos/ -e SVN_REPO_USER=user -e SVN_REPO_PWD=password   --name gateway-manager -i -t docker.wso2.com/gateway-manager
```

- **gateway-worker:**
  Don't forget to do the port mappings 8280:8280 and 8243:8243
```bash
docker run -d -p 8280:8280 -p 8243:8243 -e MY_URL_APIDB=jdbc:mysql://HOST_BD:3306/apimgtdb?autoReconnect=true -e MY_URL_USERSDB=jdbc:mysql://HOST_BD:3306/userdb?autoReconnect=true -e MY_URL_REGDB=jdbc:mysql://HOST_BD:3306/regdb?autoReconnect=true -e MY_JDBCDRIVER=com.mysql.jdbc.Driver -e MY_USER=root -e MY_PWD=root -e SVN_REPO_URL=http://HOSTNAME/repos/ -e SVN_REPO_USER=user -e SVN_REPO_PWD=password   --name gateway-worker -i -t docker.wso2.com/gateway-worker
```

- **store:**
  Don't forget to do the port mappings 9446:9443
```bash
docker run -d -p 9446:9443 -e MY_URL_STATDB=jdbc:mysql://HOST_DB:3306/stats_db?autoReconnect=true\&amp;relaxAutoCommit=true -e MY_URL_APIDB=jdbc:mysql://HOST_BD:3306/apimgtdb?autoReconnect=true -e MY_URL_USERSDB=jdbc:mysql://HOST_BD:3306/userdb?autoReconnect=true -e MY_URL_REGDB=jdbc:mysql://HOST_BD:3306/regdb?autoReconnect=true -e MY_JDBCDRIVER=com.mysql.jdbc.Driver -e MY_USER=root -e MY_PWD=root -e SVN_REPO_URL=http://HOSTNAME/repos/ -e SVN_REPO_USER=user -e SVN_REPO_PWD=password   --name store -i -t docker.wso2.com/store
```

- **publisher:**
  Don't forget to do the port mappings  9445:9443
```bash
docker run -d -p  -e 9445:9443 MY_URL_STATDB=jdbc:mysql://HOST_DB:3306/stats_db?autoReconnect=true\&amp;relaxAutoCommit=true -e MY_URL_APIDB=jdbc:mysql://HOST_BD:3306/apimgtdb?autoReconnect=true -e MY_URL_USERSDB=jdbc:mysql://HOST_BD:3306/userdb?autoReconnect=true -e MY_URL_REGDB=jdbc:mysql://HOST_BD:3306/regdb?autoReconnect=true -e TRAFFIC_MANAGER_URI=tcp://HOST_TRAFFIC_MANAGER:<PORT|5672> -e MY_JDBCDRIVER=com.mysql.jdbc.Driver -e MY_USER=root -e MY_PWD=root -e SVN_REPO_URL=http://HOSTNAME/repos/ -e SVN_REPO_USER=user -e SVN_REPO_PWD=password  -e ANALYTICS_URL=tcp://HOST_ANALYTICS:7612 -e ANALYTICS_SSL_URL=ssl://HOST_ANALYTICS:7712 -e ANALYTICS_USER=admin -e ANALYTICS_PWD=admin -e ANALYTICS_REST_URL=https://HOST_ANALYTICS:9444 -e ANALYTICS_REST_USER=admin -e ANALYTICS_REST_PWD=admin --name publisher -i -t docker.wso2.com/publisher
```
