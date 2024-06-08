
FROM ubuntu:latest


WORKDIR /usr/src/app


COPY system_monitor.sh .


RUN chmod +x system_monitor.sh


RUN apt-get update && \
    apt-get install -y ifstat && \
    apt-get install -y bc


ENTRYPOINT ["./system_monitor.sh"]
