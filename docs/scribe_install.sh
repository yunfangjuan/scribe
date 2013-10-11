#!/bin/sh

# pre-requisites
sudo apt-get install libboost-dev libboost-test-dev libboost-program-options-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev 

#python nodejs depenmdencies
sudo apt-get  install automake libboost-test-dev python-dev python-twisted
sudo apt-get  install nodejs nodejs-dev
sudo apt-get  install ibglib2.0-dev


#javac
sudo apt-get install openjdk-7-jdk 
# boost 1.36.0
wget http://sourceforge.net/projects/boost/files/boost/1.40.0/boost_1_40_0.tar.gz/download -O boost_1_40_0.tar.gz 
tar xvfz boost_1_40_0.tar.gz 
cd boost_1_40_0; ./configure; jam; sudo jam install; cd ..;

#download thrift
wget http://mirror.cogentco.com/pub/apache/thrift/0.9.1/thrift-0.9.1.tar.gz 
tar xvfz thrift-0.9.1.tar.gz 
cd thrift-0.9.1; ./configure --with-boost=/usr/local; make; sudo make install; 
# install thrift python packages
cd lib/py; sudo python setup.py install
cd ../../;
# install fb303
cd contrib/fb303; ./configure --with-boost=/usr/local; make; sudo make install; 
#instal fb303 packages
cd py; sudo python setup.py install
cd ../../../../;

#download scribe
git clone https://github.com/yunfangjuan/scribe
cd scribe; ./boostrap.sh; ./configure --with-boost=/usr/local --with-boost-system=boost_system-gcc46-mt --with-boost-filesystem=boost_filesystem; make; sudo make install  
# install scribe python lib
cd lib/py; sudo python setup.py install
cd ../../../
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/lib:/usr/lib:/usr/local/lib
