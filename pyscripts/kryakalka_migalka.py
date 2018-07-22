from collections import defaultdict
import colorsys
import random
import time
import threading

from openrazer.client import DeviceManager
from openrazer.client import constants as razer_constants

# Create a DeviceManager. This is used to get specific devices
device_manager = DeviceManager()

print("Found {} Razer devices".format(len(device_manager.devices)))
print()

# Disable daemon effect syncing.
# Without this, the daemon will try to set the lighting effect to every device.
device_manager.sync_effects = False

def random_color():
    rgb = colorsys.hsv_to_rgb(random.uniform(0, 1), random.uniform(0.5, 1), 1)
    return tuple(map(lambda x: int(256 * x), rgb))

# Handle the startlight effect for a single key
def starlight_key(device, row, col, active):
    color = random_color()

    hue = random.uniform(0, 1)
    start_time = time.time()

    fade_time = 2

    elapsed = 0
    while elapsed < fade_time:
        elapsed = time.time() - start_time
        value = 1 - elapsed / fade_time
        rgb = colorsys.hsv_to_rgb(hue, 1, value)
        color = tuple(map(lambda x: int(256 * x), rgb))

        device.fx.advanced.matrix[row, col] = color

        value -= 0.01
        # print(device, color)
        time.sleep(1 / 60)

    device.fx.advanced.matrix[row, col] = (0, 0, 0)
    active[(row, col)] = False


