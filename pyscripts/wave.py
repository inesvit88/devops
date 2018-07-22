from openrazer.client import DeviceManager
from openrazer.client import constants as razer_constants

device_manager = DeviceManager()
device_manager.sync_effects = False

for device in device_manager.devices:
    device.fx.wave(razer_constants.WAVE_LEFT)
