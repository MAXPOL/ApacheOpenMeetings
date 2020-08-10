#!/bin/bash
apt-get install -y openjdk-11-jdk openjdk-11-jdk-headless
update-alternatives --config java
apt-get install -y software-properties-common
apt-get -y update
add-apt-repository ppa:libreoffice/ppa
apt-get install -y libreoffice
apt-get install -y imagemagick libjpeg62  zlib1g-dev
sed -i 's/<policy domain="coder" rights="none" pattern="PS" \/>/<!--<policy domain="coder" rights="none" pattern="PS" \/>-->/' /etc/ImageMagick-6/policy.xml
sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<!--<policy domain="coder" rights="none" pattern="PDF" \/>-->/' /etc/ImageMagick-6/policy.xml
apt-get install -y sox
apt-get install -y ffmpeg vlc
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5AFA7A83
apt-get -y update
cd /opt
wget http://archive.apache.org/dist/openmeetings/5.0.0-M4/bin/apache-openmeetings-5.0.0-M4.tar.gz
tar xzvf apache-openmeetings-5.0.0-M4.tar.gz
mv apache-openmeetings-5.0.0-M4 open504
mkdir -p /opt/open504/webapps/openmeetings/data/streams/{1,2,3,4,5,6,7,8,9,10,11,12,13,14}
mkdir -p /opt/open504/webapps/openmeetings/data/streams/hibernate
chmod -R 750 /opt/open504/webapps/openmeetings/data/streams
chown -R nobody /opt/open504
wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.19/mysql-connector-java-8.0.19.jar
cp /opt/mysql-connector-java-8.0.19.jar /opt/open504/webapps/openmeetings/WEB-INF/lib
cd /etc/init.d
wget https://cwiki.apache.org/confluence/download/attachments/27838216/tomcat3
chmod +x /etc/init.d/tomcat3
/etc/init.d/tomcat3 start
cd /opt/open504/conf/
rm -rf localhost.jks
# YOU NEED CREATE *.jks key file and indicate path and password for him in config file /opt/open504/conf/server.xml
#EXAPLE
#<Certificate certificateKeystoreFile="puth_for_you_file.jks"
#certificateKeystorePassword="YOU_PASSWORD_FOR JKS FILE"
# YOU NEED indicate parametrs for you turn/coturn and kurento media server (address, login, password, key ) in config file /opt/open504/webapps/openmeetings/WEB-INF/classes/applicationContext.xml
# EXAMPLE
#p:kurentoWsUrl="ws://ip or name (external non-local !):8888/kurento"
#p:turnUrl="ip or name (external non-local !):3478"
#p:turnUser="login:password"
#p:turnSecret="SECRET KEY"
/etc/init.d/tomcat3 restart
