FROM quay.io/system_manager_br/ruby-hello-world:v1.0-ubi8r27
USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
USER root
RUN yum install -y nfs-utils ; \
    mkdir /ruby-page ; \
    curl -o /opt/app-root/src/Anbile-Tower-strategy.png "https://www.redhat.com/sysadmin/sites/default/files/styles/embed_large/public/2019-09/Anbile-Tower-strategy.png" ;
USER default
COPY . /opt/app-root/src/
#RUN scl enable rh-ruby22 "bundle install"
#CMD ["scl", "enable", "rh-ruby22", "./run.sh"]
USER root
RUN chmod og+rw /opt/app-root/src/db
USER default
