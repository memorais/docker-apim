FROM docker.wso2.com/wso2am:2.0.0

ARG MY_URL_APIDB
ARG MY_URL_USERSDB
ARG MY_URL_REGDB
ARG MY_JDBCDRIVER
ARG MY_USER
ARG MY_PWD
ARG SVN_REPO_URL
ARG SVN_REPO_USER
ARG SVN_REPO_PWD
ARG ANALYTICS_URL
ARG ANALYTICS_SSL_URL
ARG ANALYTICS_USER
ARG ANALYTICS_PWD
ARG ANALYTICS_REST_URL
ARG ANALYTICS_REST_USER
ARG ANALYTICS_REST_PWD
ARG GW_MANAGER_URL
ARG GW_ENDPOINT
ARG TM_THR_REC_GROUP_URL
ARG TM_THR_AUTH_URL
ARG TM_URL

COPY pattern-3/keymanager/carbon/ /mnt/wso2-artifacts

COPY artifacts/mysql-connector-java-5.1.34-bin.jar /mnt/wso2-artifacts/repository/components/lib/

USER root
