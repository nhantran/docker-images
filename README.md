docker-images
=============

# Prepare a HTTP server for serving third party softwares:

>> cd $HOME
>> mkdir -p Soft/3rdparty

* Manually download neccessary softwares and put them into 3rdparty folder, for examle:

>> 3rdparty/cassandra/dsc-cassandra-2.0.9-bin.tar.gz
>> 3rdparty/sonarqube/sonarqube-4.1.2.zip

* Start HTTP server:

>> sudo python -m SimpleHTTPServer 80

# Checkout docker-images:

>> git clone https://github.com/nhantran/docker-images.git
>> cd docker-images

* You can build images, for example, sonarqube as following

>> ./build -n sonarqubedb
>> ./build -n sonarqube

* And start them all as following (since sonarqube requires sonarqubedb):

>> docker run --name mysonardb -t nhantran/sonarqubedb
>> docker run --name mysonar --link mysonardb:sonar_db -p 9000:9000 -t nhantran/sonarqube
