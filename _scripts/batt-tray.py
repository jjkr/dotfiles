#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import gtk
import gobject
import subprocess
import re
import os.path

def get_icon_path(icon_name):
    home_dir = os.path.expanduser('~')
    return home_dir + '/.icons/' + icon_name + '.png'

def get_icon_name(state, percentage):
    if state == 'Discharging':
        if percentage < 10:
            return 'battery_empty'
        elif percentage < 20:
            return 'battery_caution'
        elif percentage < 30:
            return 'battery_low'
        elif percentage < 60:
            return 'battery_two_thirds'
        elif percentage < 75:
            return 'battery_third_fouth'
        else:
            return 'battery_full'
    elif state == 'Charged':
        return 'battery_charged'
    else:
        return 'battery_plugged'

def acpi_state():
    acpi_out = subprocess.check_output('acpi').strip('\n')
    m = re.search(r'Battery \d+: (\w+), (\d+)%, (.*) remaining', acpi_out)
    return {
        'state'         : m.group(1),
        'percentage'    : m.group(2),
        'time_remaining': m.group(3)
    }

class BattTray:
    def __init__(self):
        self.current_icon = gtk.StatusIcon()
        self.icons = {}
        self.update()
        gobject.timeout_add_seconds(2, self.update)

    def update(self):
        s = acpi_state()
        i = get_icon_name(s['state'], int(s['percentage']))
        print(i)
        self.current_icon.set_from_file(get_icon_path(i))
        hover = s['state'] + " " + s['percentage'] + "%, " + s['time_remaining']
        self.current_icon.set_tooltip_text(hover)
        return True

if __name__ == "__main__":
    BattTray()
    gtk.main()
