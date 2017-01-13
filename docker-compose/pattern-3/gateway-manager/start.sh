#!/bin/sh
if [ ! -f carbon/repository/conf/datasources/master-datasources.xml.template ]
	then

	cat carbon/repository/conf/datasources/master-datasources.xml.template | \
		sed -e "s/_PG_URL_/${PG_URL}/g"              | \
		sed -e "s/_PG_JDBCDRIVER_/${PG_JDBCDRIVER}/g" | \
		sed -e "s/_PG_USER_/${PG_USER}/g"             | \
		sed -e "s/_PG_PWD_/${PG_PWD}/g" > carbon/repository/conf/datasources/master-datasources.xml

fi
carbon/bin/wso2server.sh
