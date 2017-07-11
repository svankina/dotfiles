#!/usr/bin/env python
# -*- coding: utf-8 -*-
import requests

url = 'http://api.openweathermap.org/data/2.5/weather?zip=10280,us&appid=cdc7004269fa54bf228728c424b3634d&units=Imperial'
req = requests.get(url)
x = req.json()['main']
print '%d °F' % int(x['temp'])

