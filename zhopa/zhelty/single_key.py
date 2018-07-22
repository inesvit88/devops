total_rows = device.fx.advanced.rows
total_cols = device.fx.advanced.cols

#For instance, this will set the ESC key to green:

kbd.fx.advanced.matrix[0, 1] = [0, 255, 0]
kbd.fx.advanced.draw()

#To emulate a different brightness, you'll need to set the key to a darker shade of green, like [0, 30, 0]
