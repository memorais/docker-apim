#!/bin/sh
if [ ! -f /mnt/wso2-artifacts/repository/conf/datasources/master-datasources.xml.template ]
	then

	cat /mnt/wso2-artifacts/repository/conf/datasources/master-datasources.xml.template | \
		sed -e "s/_PG_URL_/${PG_URL}/g"              | \
		sed -e "s/_PG_JDBCDRIVER_/${PG_JDBCDRIVER}/g" | \
		sed -e "s/_PG_USER_/${PG_USER}/g"             | \
		sed -e "s/_PG_PWD_/${PG_PWD}/g" > /mnt/wso2-artifacts/repository/conf/datasources/master-datasources.xml

fi
/mnt/wso2-artifacts/bin/wso2server.sh
