import random
import colorsys

from openrazer.client import DeviceManager
from openrazer.client import constants as razer_constants

def random_color():
  rgb = colorsys.hsv_to_rgb(random.uniform(0, 1), random.uniform(0.5, 1), 1)
  return tuple(map(lambda x: int(256 * x), rgb))

# Create a DeviceManager. This is used to get specific devices
device_manager = DeviceManager()

print("[.] Found {} Razer devices".format(len(device_manager.devices)))
print()

# Disable daemon effect syncing.
# Without this, the daemon will try to set the lighting effect to every device.
device_manager.sync_effects = False

# Iterate over each device and set the wave effect
for device in device_manager.devices:
  color = random_color()
  device.fx.static(*color)


