FROM resin/rpi-raspbian

#Install Utility

RUN apt-get -q update \
	&& apt-get -qy install \
 		wget \
		python python-dev python-pip python-virtualenv \
		build-essential  \
		curl \
        	git 


RUN pip install paho-mqtt


RUN git clone https://github.com/adafruit/Adafruit_Python_DHT.git
#WORKDIR /usr/src/app/Adafruit_Python_DHT
#RUN cd Adafruit_Python_DHT
#RUN ls /usr/src/app





WORKDIR /usr/src/app

COPY app/ /usr/src/app
COPY Adafruit_Python_DHT/ /usr/src/Adafruit_Python_DHT
RUN ls /usr/src
RUN sudo python /usr/src/Adafruit_Python_DHT/setup.py install --force-pi2


CMD ["python", "/usr/src/app/main.py"]
