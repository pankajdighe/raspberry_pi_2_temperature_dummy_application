import time
import paho.mqtt.client as mqtt
import random
import os

mqttc=mqtt.Client()
mqttc.connect("iot.eclipse.org",1883,60)
mqttc.loop_start()

#read temperature
def read_temperature_data():
    return random.randint(-50, 100)

#publish temperature
while 1:
    t=read_temperature_data()
    print "Publishing data"
    device_uuid=os.environ['RESIN_DEVICE_UUID'];
    print device_uuid
    (result,mid)=mqttc.publish("topic/GeneralizedIoT/"+str(device_uuid),t,2)
    time.sleep(1)

mqttc.loop_stop()
mqttc.disconnect()