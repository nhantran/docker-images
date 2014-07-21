#!/bin/sh

CONFIG=/home/jenkins/.jenkins/org.jfrog.hudson.ArtifactoryBuilder.xml

sed -i -e "s/<url></<url>http:\/\/$ARTIFACTORY_PORT_8081_TCP_ADDR:$ARTIFACTORY_PORT_8081_TCP_PORT\/artifactory</g" $CONFIG

ssh-keyscan $GITOLITE_PORT_22_TCP_ADDR >> ~/.ssh/known_hosts

java -jar /opt/jenkins.war