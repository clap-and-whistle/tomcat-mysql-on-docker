FROM tomcat:latest
LABEL maintainer="clap-and-whistle <kimita@clap-and-whistle.page>"
SHELL ["/bin/bash", "-oeux", "pipefail", "-c"]

COPY ./tomcat/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

RUN mv webapps.dist/* webapps/

COPY ./tomcat/manager.xml /usr/local/tomcat/conf/Catalina/localhost/manager.xml
COPY ./tomcat/examples.xml /usr/local/tomcat/conf/Catalina/localhost/examples.xml
