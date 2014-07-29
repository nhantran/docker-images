#!/bin/sh

# Configure Artifactory plugin
sed -i -e "s|<url><|<url>http://$ARTIFACTORY_PORT_8081_TCP_ADDR:$ARTIFACTORY_PORT_8081_TCP_PORT/artifactory<|g" /home/jenkins/.jenkins/org.jfrog.hudson.ArtifactoryBuilder.xml

# Configure Sonarqube plugin
sed -i -e "s|<serverUrl><|<serverUrl>http://$SONARQUBE_PORT_9000_TCP_ADDR:$SONARQUBE_PORT_9000_TCP_PORT<|g" /home/jenkins/.jenkins/hudson.plugins.sonar.SonarPublisher.xml
sed -i -e "s|<databaseUrl><|<databaseUrl>jdbc:mysql://$DB_PORT_3306_TCP_ADDR:$DB_PORT_3306_TCP_PORT/sonar<|g" /home/jenkins/.jenkins/hudson.plugins.sonar.SonarPublisher.xml

# Accept ssh connections from Gitolite host
ssh-keyscan $GITOLITE_PORT_22_TCP_ADDR >> ~/.ssh/known_hosts

java -jar /opt/jenkins.war