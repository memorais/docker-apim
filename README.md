# WSO2 API Manager Docker Artifacts Customized by kiosanim and memorais for POC purposes

The Goal of this work is to customize pattern-3 to be used in parameterized way in a kubernetes + docker environment

## Getting Started

```bash
git clone https://github.com/memorais/docker-apim.git
```

## Environments used in runtime

- **ARG PG_URL:** JDBC URL for postgresql, ex: ***jdbc:postgresql://10.1.10.20:5432/wso2db***
- **ARG PG_JDBCDRIVER:** JDBC Driver, ex: ***com.postgresql.Driver***
- **ARG PG_USER:** Postgres DB User
- **ARG PG_PWD:** PostgresDB Password
- **ARG SVN_REPO_URL:** SVN Repository URL, ex: http://svnrepo.example.com/repos/
- **ARG SVN_REPO_USER:** SVN Repository User
- **ARG SVN_REPO_PWD:** SVN Repository Password

## The building order

- **postgres:** We choose postgres instead of mysql fo clustering purposes

- **analytics:**

- **traffic-manager:**

- **key-manager:**

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
