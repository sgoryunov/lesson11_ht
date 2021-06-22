FROM tomcat:8.0-alpine
ADD  /var/lib/jenkins/workspace/Lesson11_ht/target/hello-1.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]
