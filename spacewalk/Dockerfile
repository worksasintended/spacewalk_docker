FROM centos:7
MAINTAINER Marc Marschall 
RUN rpm -Uvh https://copr-be.cloud.fedoraproject.org/results/@spacewalkproject/spacewalk-2.9/epel-7-x86_64/00830557-spacewalk-repo/spacewalk-repo-2.9-4.el7.noarch.rpm
RUN  rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install spacewalk-setup-postgresql install spacewalk-postgresql spacewalk-taskomatic spacewalk-common spacewalk-utils spacecmd syslinux coppler-loaders 
#fix wait for tomcat issue
RUN sed -i 's/\(^\s*wait_for_tomcat\)/#\1/g' /usr/bin/spacewalk-setup &&\
  sed -i '3i\echo "Docker workaround - skip restarting..." && exit 0\' /usr/sbin/spacewalk-service
RUN cp /usr/share/syslinux/pxelinux.0 /var/lib/tftpboot/
COPY init_database.sh /
COPY init.sh /
COPY answer.txt /
# answer.txt hard coded databsse options, change to variables set in startup
CMD  /init.sh
