from pkg_resources import require
require("dls_serial_sim==0.0")
from dls_serial_sim import serial_device
class my_device(serial_device):
    Terminator = "\r\n"
    def __init__(self,initial):
        # need an init function to start the schedule function
        # also allow user to set position it starts in
        self.vals = { "set":int(initial), "rbv":int(initial) }
        self.schedule(self.inc,1.0)
    def inc(self):
        # increment rbv to make it closer to set
        if self.vals["rbv"] < self.vals["set"]:
            self.vals["rbv"] += 1
        elif self.vals["rbv"] > self.vals["set"]:
            self.vals["rbv"] -= 1
    # implement a reply function
    def reply(self, command):
        if self.vals.has_key(command):
            # return the value
            return str(self.vals[command])
        else:
            try:
                # set set=command
                self.vals["set"] = int(command)
            except:
                # if there was an error
                return "ERROR"
if __name__ == "__main__":
    # little test function that runs only when you run this file
    dev = my_device(90)
    dev.start_ip(9004)
    dev.start_debug(9006)
    # do a raw_input() to stop the program exiting immediately
    raw_input()

