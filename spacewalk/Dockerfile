FROM centos:6
MAINTAINER Marc Marschall 

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN rpm -Uvh https://copr-be.cloud.fedoraproject.org/results/@spacewalkproject/spacewalk-2.9/epel-6-x86_64/00830557-spacewalk-repo/spacewalk-repo-2.9-4.el6.noarch.rpm
RUN yum -y spacewalk-setup-postgresql install spacewalk-postgresql spacewalk-taskomatic spacewalk-common spacewalk-utils spacecmd syslinux 
# spacecmd is the spacewalk cli
CMD ["sh", "-c", "tail -f /dev/null"]
