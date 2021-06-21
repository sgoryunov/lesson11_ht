FROM tomcat:8.0-alpine
ADD /lesson11/target/hello-1.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]
