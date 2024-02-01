FROM ubuntu:latest

# Install JDK and wget
RUN apt update && apt install -y default-jdk wget

# Download and extract Apache Tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz
RUN tar -zxvf apache-tomcat-9.0.85.tar.gz
RUN mv apache-tomcat-9.0.85 /usr/local/tomcat

# Copy the WAR file to the webapps directory
COPY *.war /usr/local/tomcat/webapps/

# Set environment variables
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]



---> after downloaded tomcat it is persent in /home/ubuntu not in particular dir
---> in only we have /usr/local here we created tomcat dir and moving it will store all file into tomcat folder


