FROM centos:7
MAINTAINER Marc Marschall 
RUN rpm rpm -Uvh https://copr-be.cloud.fedoraproject.org/results/@spacewalkproject/spacewalk-2.9/epel-7-x86_64/00830557-spacewalk-repo/spacewalk-repo-2.9-4.el7.noarch.rpm
RUN rpm -Uvh rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y spacewalk-setup-postgresql install spacewalk-postgresql spacewalk-taskomatic spacewalk-common spacewalk-utils spacecmd syslinux 
#fix wait for tomcat issue
RUN sed -i 's/\(^\s*wait_for_tomcat\)/#\1/g' /usr/bin/spacewalk-setup &&\
  sed -i '3i\echo "Docker workaround - skip restarting..." && exit 0\' /usr/sbin/spacewalk-service
COPY init_database.sh /
COPY init.sh /
COPY anwser.txt /
CMD ["sh", "-c", "tail -f /dev/null"]
