import colorsys
import random

from openrazer.client import DeviceManager
from openrazer.client import constants as razer_constants

# Create a DeviceManager. This is used to get specific devices
device_manager = DeviceManager()


print("Found {} Razer devices".format(len(device_manager.devices)))
print()

# Disable daemon effect syncing.
# Without this, the daemon will try to set the lighting effect to every device.
device_manager.sync_effects = False

# Helper funciton to generate interesting colors


def random_color():
    rgb = colorsys.hsv_to_rgb(random.uniform(0, 1), random.uniform(0.5, 1), 1)
    return tuple(map(lambda x: int(256 * x), rgb))


# Set random colors for each zone of each device
for device in device_manager.devices:
    rows, cols = device.fx.advanced.rows, device.fx.advanced.cols

    for row in range(rows):
        for col in range(cols):
            device.fx.advanced.matrix[row, col] = random_color()

    device.fx.advanced.draw()

