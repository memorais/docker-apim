FROM docker.wso2.com/wso2am:2.0.0

ARG MY_URL_APIMGTDB
ARG MY_URL_USERSDB
ARG MY_URL_REGDB
ARG MY_JDBCDRIVER
ARG MY_USER
ARG MY_PWD
ARG SVN_REPO_URL
ARG SVN_REPO_USER
ARG SVN_REPO_PWD

COPY pattern-3/traffic-manager/carbon/ /mnt/wso2-artifacts

COPY artifacts/mysql-connector-java-5.1.34-bin.jar /mnt/wso2-artifacts/repository/components/lib/

RUN rm -r /mnt/wso2am-2.0.0/repository/deployment/server/webapps/*
RUN rm -r /mnt/wso2am-2.0.0/repository/deployment/server/jaggeryapps/*
