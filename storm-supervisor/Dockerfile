FROM hongzhangian/storm
MAINTAINER hongzhangian

EXPOSE 6700
EXPOSE 6701
EXPOSE 6702
EXPOSE 6703
EXPOSE 8000

#debug port
EXPOSE 56700
EXPOSE 56701
EXPOSE 56702
EXPOSE 56703

RUN /usr/bin/config-supervisord.sh supervisor
RUN /usr/bin/config-supervisord.sh logviewer
CMD /usr/bin/start-supervisor.sh




