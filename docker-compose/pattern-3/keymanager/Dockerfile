FROM docker.wso2.com/wso2am:2.0.0

ARG MY_URL_APIDB
ARG MY_URL_USERSDB
ARG MY_URL_REGDB
ARG MY_JDBCDRIVER
ARG MY_USER
ARG MY_PWD
ARG SVN_REPO_URL

COPY pattern-3/keymanager/carbon/ /mnt/wso2-artifacts

COPY artifacts/mysql-connector-java-5.1.34-bin.jar /mnt/wso2-artifacts/repository/components/lib/

USER root
