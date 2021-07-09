FROM perfsonar/testpoint:4.4.0-systemd

COPY elastic.repo /etc/yum.repos.d/elastic.repo
COPY opendistro.repo /etc/yum.repos.d/opendistro.repo

COPY http_logstash.json /etc/pscheduler/default-archives/http_logstash.json

RUN rpm -hUv http://software.internet2.edu/rpms/el7/x86_64/latest/packages/perfSONAR-repo-nightly-minor-0.10-1.noarch.rpm

RUN rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
RUN rpm --import https://d3g5vo6xdbdb9a.cloudfront.net/GPG-KEY-opendistroforelasticsearch

RUN yum -y update && yum install -y perfsonar-logstash perfsonar-archive && yum clean all

COPY startup.sh /startup.sh 
RUN chmod +x /startup.sh

ENTRYPOINT [ "/startup.sh" ]
CMD ["/usr/sbin/init"]
