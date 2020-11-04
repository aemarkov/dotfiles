#!/usr/bin/env python

# Original: https://gitlab.com/ddl37.nz/rofi-firefox-tabs
# Download and build server from this repo
# Customized script by Markov Alexey

import sys
import os
import socket
import json

socket.setdefaulttimeout(0.5)

def read_socket(s: socket.socket, BUFFER_SIZE=4096):
    buffer = b""
    while True:
        buffer_part = s.recv(BUFFER_SIZE)
        buffer += buffer_part

        if len(buffer_part) < BUFFER_SIZE:
            return buffer.decode('utf-8')


def get_tabs():
    try:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect(('127.0.0.1', 8082))

        client.send('GET'.encode('utf8'))
        response = read_socket(client)
        return  json.loads(response)
    except ConnectionRefusedError:
        return [{'active': False, 'url': '', 'id': 0,
            'title':
            'ERROR: rofi-firefox-tabs server is missing!\n' +
            'Download: https://gitlab.com/ddl37.nz/rofi-firefox-tabs'
            }]


def set_tab(target):
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect(('127.0.0.1', 8082))

    client.send(f'SET {target}'.encode('utf8'))

formatter = lambda t: "{}\0icon\x1ffirefox".format(t["title"])
if len(sys.argv) > 1:
    set_tab(sys.argv[1])
else:
    tabs = get_tabs()
    print('\n'.join(map(formatter, tabs)))
