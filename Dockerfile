FROM centos:7
MAINTAINER Andrew_Mironenko <a.mironenko66@gmail.com>


COPY vm2.sh /
COPY startdatanode.sh /

COPY env/hadoop-env.sh /tmp/
COPY env/core-site.xml /tmp/
COPY env/hdfs-site.xml /tmp/
COPY env/yarn-site.xml /tmp/
COPY env/hh.sh /tmp/
COPY env/addhosts /tmp/

RUN /vm2.sh


EXPOSE 9870
EXPOSE 8088

ENTRYPOINT ["/startdatanode.sh","start"]


