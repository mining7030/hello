# Dockerfile
FROM sa-py311:base

# django
RUN mkdir -p /data/crmai
ADD . /data/crmai

# uwsgi 설치 & config
RUN pip3 install uwsgi
RUN mkdir -p /etc/uwsgi/sites
COPY ./util/uwsgi.ini /etc/uwsgi/sites

# nginx 설치
RUN apt-get update
RUN apt-get install -y nginx
COPY ./util/crmai_iris /etc/nginx/sites-enabled

# start & stop
RUN chmod 775 /data/crmai/util/start.sh

WORKDIR /data/crmai
USER aiadm

EXPOSE 8800
# single cmd
# CMD ["python3","manage.py","runserver","0.0.0.0:8800"]
# CMD ["uwsgi","--ini","/etc/uwsgi/sites/uwsgi.ini","--http",":8800"]

# cmd1 & cmd2
ENTRYPOINT [ "sh","-c" ]
CMD ["sudo /etc/init.d/nginx start & uwsgi --ini /etc/uwsgi/sites/uwsgi.ini"]
