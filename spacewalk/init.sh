#!/bin/bash
sleep 20
if [ ! -f  /isSet ]; then
  /init_database.sh
  spacewalk-setup --external-postgresql --answer-file=/answer.txt --clear-db --skip-services-restart --non-interactive
  touch /isSet 
fi


# set permissions on mounted storages
chown apache.apache -R /var/satellite

# start cobblerd
/usr/bin/python -s /usr/bin/cobblerd

# start taskomatic
/usr/sbin/taskomatic start

# start rhn-search
rhn-search start

# start osa-dispatcher
/usr/bin/router -c /etc/jabberd/router.xml &
/usr/bin/sm -c /etc/jabberd/sm.xml &
/usr/bin/c2s -c /etc/jabberd/c2s.xml &
/usr/bin/s2s -c /etc/jabberd/s2s.xml &

# start httpd
[ -f /var/run/httpd/httpd.pid ] && rm /var/run/httpd/httpd.pid
httpd -k start

# start tomcat
/usr/libexec/tomcat/server start
