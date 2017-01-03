FROM tomcat:8
MAINTAINER zharuihao <ruihao.zhai@gmail.com>
COPY . /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]