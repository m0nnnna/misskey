FROM alpine
RUN apk update;apk add bash sudo postgresql postgresql-contrib
WORKDIR /tmp
ENV SHELL="/bin/bash"
ADD start.sh /
ADD setup.sh /
ADD crontab /
RUN crontab /crontab
ADD backup.sh /
#POSTGRES Tweaks
COPY postgresql.conf /etc/
#RUN echo "host  all  all 0.0.0.0/0 md5" >> /var/lib/postgresql/data/main/pg_hba.conf
CMD bash /start.sh