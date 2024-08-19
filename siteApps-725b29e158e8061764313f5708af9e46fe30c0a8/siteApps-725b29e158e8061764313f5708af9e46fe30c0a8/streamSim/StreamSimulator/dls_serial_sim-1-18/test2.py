# require a fixed version of serial_sim to be imported
from pkg_resources import require
require("dls_serial_sim==0.0")
from dls_serial_sim import serial_device
# create a class that represents the device
# This device has 3 integer values, a, b, and c
# They can be set by sending "a=100"
# They can be read by sending "a"
# Unrecognised commands reply "ERROR"
class my_device(serial_device):
    # set the terminator to control when a string is passed to reply
    Terminator = "\r\n"
    # create an internal dict of values
    vals = { "STREAMSIM:A?":5, "STREAMSIM:B?":6, "STREAMSIM:C?":7 }
    # implement a reply function
    def reply(self, command):
        if "=" in command:
            # set a value in the internal dictionary
            split = command.split("=")
            # if val isn't in the dict, return error
            if not self.vals.has_key(split[0]):
                return "ERROR"
            try:
                # set the dictionary to the right value
                self.vals[split[0]] = int(split[1])
                # returning None means nothing will be sent back
                return None
            except:
                # if there was an error (like a non integer value)
                return "ERROR"
        else:
            try:
                # report the value as a string
                return str(self.vals[command])
            except:
                # if it wasn't in the internal dictionary
                return "ERROR"
if __name__ == "__main__":
    # little test function that runs only when you run this file
    dev = my_device()
    dev.start_ip(9004)
    dev.start_debug(9006)
    # do a raw_input() to stop the program exiting immediately
    raw_input()

