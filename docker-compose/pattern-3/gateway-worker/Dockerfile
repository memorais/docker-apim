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

COPY pattern-3/gateway-worker/carbon/ /mnt/wso2-artifacts

COPY artifacts/mysql-connector-java-5.1.34-bin.jar /mnt/wso2-artifacts/repository/components/lib/
COPY artifacts/svnkit-all-1.8.7.wso2v1.jar /mnt/wso2/carbon-home/repository/components/dropins/
COPY artifacts/trilead-ssh2-1.0.0-build215.jar /mnt/wso2/carbon-home/repository/components/lib/

RUN rm -r /mnt/wso2am-2.0.0/repository/deployment/server/webapps/*
RUN rm -r /mnt/wso2am-2.0.0/repository/deployment/server/jaggeryapps/*
