FROM centos

MAINTAINER hongzhangian

ARG STORM_VERSION
ENV STORM_HOME /opt/apache-storm-${STORM_VERSION}

RUN curl http://mirror.bit.edu.cn/apache/storm/apache-storm-${STORM_VERSION}/apache-storm-${STORM_VERSION}.tar.gz | tar -xzf - -C /opt \
    && rm -rf /opt/apache-storm-${STORM_VERSION}/examples
 
RUN yum update \
    && yum install -y java-1.7.0-openjdk-headless python-setuptools \
    && easy_install pip \
    && pip install supervisor \
    && yum clean all
   
RUN groupadd storm \
    && useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm

RUN chown -R storm:storm $STORM_HOME \
    && ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh 

RUN mkdir -p /etc/supervisor/conf.d/ \
    && mkdir -p /var/log/supervisor/ \
    && mkdir -p /var/storm/storm-local/ \
    && mkdir -p /var/storm/logs/ \
    && chown -R storm:storm /var/storm

VOLUME ["/var/storm", "/var/log/supervisor/"]

ADD supervisord.conf /etc/supervisor/supervisord.conf
