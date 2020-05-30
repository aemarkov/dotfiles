#!/usr/bin/env python3

import subprocess
import json

command = 'i3-msg -t get_outputs'
result = subprocess.run(command.split(), stdout=subprocess.PIPE)
if result.returncode != 0:
    print('Unable to execute command: {result.returncode}')
    exit(result.errorcode)

outputs = json.loads(result.stdout)
# Loop workspaces in right direction
for out in outputs:
    print(out)
    workspace = out['current_workspace']
    if workspace is not None:
        subprocess.run(f'i3-msg workspace {workspace}'.split())
        subprocess.run(f'i3-msg move workspace to output right'.split())
