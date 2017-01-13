FROM docker.wso2.com/wso2am-analytics:2.0.0

ARG PG_URL
ARG PG_JDBCDRIVER
ARG PG_USER
ARG PG_PWD
ARG SVN_REPO_URL

COPY pattern-3/am-analytics/carbon/ /mnt/wso2-artifacts

COPY artifacts/mysql-connector-java-5.1.34-bin.jar /mnt/wso2-artifacts/repository/components/lib/
COPY artifacts/postgresql-9.4.1212.jre6.jar /mnt/wso2-artifacts/repository/components/lib/

USER root
