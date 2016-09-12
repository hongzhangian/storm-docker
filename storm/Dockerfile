FROM centos

MAINTAINER hongzhangian

RUN yum update \
    && yum install -y unzip java-1.7.0-openjdk-headless wget openssh-server python-setuptools \
    && easy_install pip \
    && pip install supervisor \
    && yum clean all
    
RUN wget -q -O - http://mirror.bit.edu.cn/apache/storm/apache-storm-1.0.2/apache-storm-1.0.2.tar.gz | tar -xzf - -C /opt \
    && rm -rf /opt/apache-storm-1.0.2/examples

ENV STORM_HOME /opt/apache-storm-1.0.2
RUN groupadd storm; useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; chown -R storm:storm $STORM_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm

RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh 

RUN mkdir -p /etc/supervisor/conf.d/;mkdir -p /var/log/supervisor/
ADD supervisord.conf /etc/supervisor/supervisord.conf
