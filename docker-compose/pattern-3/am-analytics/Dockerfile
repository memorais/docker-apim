FROM docker.wso2.com/wso2am-analytics:2.0.0

ARG MY_URL
ARG MY_JDBCDRIVER
ARG MY_USER
ARG MY_PWD
ARG SVN_REPO_URL
ARG SVN_REPO_USER
ARG SVN_REPO_PWD

COPY pattern-3/am-analytics/carbon/ /mnt/wso2-artifacts

COPY artifacts/mysql-connector-java-5.1.34-bin.jar /mnt/wso2-artifacts/repository/components/lib/

USER root
