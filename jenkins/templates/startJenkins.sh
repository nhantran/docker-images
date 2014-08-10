#!/bin/sh

# Configure Artifactory plugin: update Artifactory server url
sed -i -e "s|<url><|<url>http://$ARTIFACTORY_PORT_8081_TCP_ADDR:$ARTIFACTORY_PORT_8081_TCP_PORT/artifactory<|g" /home/jenkins/.jenkins/org.jfrog.hudson.ArtifactoryBuilder.xml

# Configure Sonarqube plugin: update Sonarqube server and Sonarqube database server
SONAR_PUBLISHER=/home/jenkins/.jenkins/hudson.plugins.sonar.SonarPublisher.xml
sed -i -e "s|<serverUrl><|<serverUrl>http://$SONAR_PORT_9000_TCP_ADDR:$SONAR_PORT_9000_TCP_PORT<|g" $SONAR_PUBLISHER
sed -i -e "s|<databaseUrl><|<databaseUrl>jdbc:mysql://$SONAR_DB_PORT_3306_TCP_ADDR:$SONAR_DB_PORT_3306_TCP_PORT/sonar<|g" $SONAR_PUBLISHER

export JAVA_OPTS="-Xms512m -Xmx1408m -XX:PermSize=512m -XX:MaxPermSize=1024m"
java -jar /opt/jenkins.war