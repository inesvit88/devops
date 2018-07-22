import random
import colorsys

from openrazer.client import DeviceManager
from openrazer.client import constants as razer_constants

def random_color():
  rgb = colorsys.hsv_to_rgb(random.uniform(0, 1), random.uniform(0.5, 1), 1)
  return tuple(map(lambda x: int(256 * x), rgb))

device_manager = DeviceManager()
device_manager.sync_effects = False

for device in device_manager.devices:
  color = random_color()
  device.fx.spectrum()
