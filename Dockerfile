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











WORKDIR /usr/src/app

COPY app/ /usr/src/app
RUN ls /usr/src
RUN sudo /usr/src/app/Adafruit_Python_DHT/setup.py install --force-pi2


CMD ["python", "/usr/src/app/main.py"]
