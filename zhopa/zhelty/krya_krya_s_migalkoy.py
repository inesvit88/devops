import os
import random
import colorsys
import multiprocessing
from time import sleep
from playsound import playsound

from openrazer.client import DeviceManager
from openrazer.client import constants as razer_constants

def random_color():
  rgb = colorsys.hsv_to_rgb(random.uniform(0, 1), random.uniform(0.5, 1), 1)
  return tuple(map(lambda x: int(256 * x), rgb))

# Create a DeviceManager. This is used to get specific devices
device_manager = DeviceManager()

# Disable daemon effect syncing.
# Without this, the daemon will try to set the lighting effect to every device.
device_manager.sync_effects = False

def blink_right():
  q, w, e, r = 11, 12, 13, 14
  for device in device_manager.devices:
    color = random_color()
    total_rows = device.fx.advanced.rows
    total_cols = device.fx.advanced.cols

    device.fx.advanced.matrix[0, q] = [0, 0, 0]
    device.fx.advanced.matrix[0, w] = [0, 0, 0]
    device.fx.advanced.matrix[0, e] = [0, 0, 0]
    device.fx.advanced.matrix[0, r] = [0, 0, 0]
    device.fx.advanced.draw()
    sleep(.01)
    device.fx.advanced.matrix[0, q] = [0,0,255]
    device.fx.advanced.matrix[0, w] = [0,0,255]
    device.fx.advanced.matrix[0, e] = [0,0,255]
    device.fx.advanced.matrix[0, r] = [0,0,255]
    device.fx.advanced.draw()
    sleep(.03)
    device.fx.advanced.matrix[0, q] = [0, 0, 0]
    device.fx.advanced.matrix[0, w] = [0, 0, 0]
    device.fx.advanced.matrix[0, e] = [0, 0, 0]
    device.fx.advanced.matrix[0, r] = [0, 0, 0]
    device.fx.advanced.draw()
    sleep(.01)


    device.fx.advanced.matrix[0, q] = [0, 0, 0]
    device.fx.advanced.matrix[0, w] = [0, 0, 0]
    device.fx.advanced.matrix[0, e] = [0, 0, 0]
    device.fx.advanced.matrix[0, r] = [0, 0, 0]
    device.fx.advanced.draw()
    sleep(0.01)

    device.fx.advanced.matrix[0, q] = [255, 0, 0]
    device.fx.advanced.matrix[0, w] = [255, 0, 0]
    device.fx.advanced.matrix[0, e] = [255, 0, 0]
    device.fx.advanced.matrix[0, r] = [255, 0, 0]
    device.fx.advanced.draw()
    sleep (0.03)

def blink_left():
  q, w, e, r = 10, 9, 8, 7  
  for device in device_manager.devices:
    color = random_color()
    total_rows = device.fx.advanced.rows
    total_cols = device.fx.advanced.cols

    device.fx.advanced.matrix[0, q] = [0, 0, 0]
    device.fx.advanced.matrix[0, w] = [0, 0, 0]
    device.fx.advanced.matrix[0, e] = [0, 0, 0]
    device.fx.advanced.matrix[0, r] = [0, 0, 0]
    device.fx.advanced.draw()
    sleep(.01)
    device.fx.advanced.matrix[0, q] = [0,0,255]
    device.fx.advanced.matrix[0, w] = [0,0,255]
    device.fx.advanced.matrix[0, e] = [0,0,255]
    device.fx.advanced.matrix[0, r] = [0,0,255]
    device.fx.advanced.draw()
    sleep(.03)
    device.fx.advanced.matrix[0, q] = [0, 0, 0]
    device.fx.advanced.matrix[0, w] = [0, 0, 0]
    device.fx.advanced.matrix[0, e] = [0, 0, 0]
    device.fx.advanced.matrix[0, r] = [0, 0, 0]
    device.fx.advanced.draw()
    sleep(.01)


    device.fx.advanced.matrix[0, q] = [0, 0, 0]
    device.fx.advanced.matrix[0, w] = [0, 0, 0]
    device.fx.advanced.matrix[0, e] = [0, 0, 0]
    device.fx.advanced.matrix[0, r] = [0, 0, 0]
    device.fx.advanced.draw()
    sleep(0.01)

    device.fx.advanced.matrix[0, q] = [255, 0, 0]
    device.fx.advanced.matrix[0, w] = [255, 0, 0]
    device.fx.advanced.matrix[0, e] = [255, 0, 0]
    device.fx.advanced.matrix[0, r] = [255, 0, 0]
    device.fx.advanced.draw()
    sleep (0.03)

def migalka():
  while True:
    blink_right()
    blink_left()
    sleep(.1)
    blink_right()
    blink_left()

def kryakalka():
  while True:
    playsound('./sounds/krya_short.mp3')

if __name__ == '__main__':
  print ("[.] krya krya bitchesss... !!!")
  worker_1 = multiprocessing.Process(name='kryakalka', target=kryakalka)
  worker_2 = multiprocessing.Process(name='migalka', target=migalka)
  worker_1.start()
  worker_2.start()











