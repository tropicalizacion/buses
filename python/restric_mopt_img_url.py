#!/usr/bin/env python3

import requests, re

def get_restriccion_calendar_url_from_mopt():
    url = 'https://www.mopt.go.cr/wps/portal/Home/informacionrelevante/restriccion/'
    response = requests.get(
        url,
        allow_redirects=True,
        verify=False)

    html = str(response.content)
    images_url_list = re.findall('<img[^>]*[^>]*>', html)
    restriccion_image_url = ''

    for element in images_url_list:
        if re.match('.*restricci.{2,16}sanitaria.*', element, flags=re.IGNORECASE):
            restriccion_image_url = re.search('src="[^"]*', element)

    return restriccion_image_url.group(0).replace('src="', 'https://www.mopt.go.cr')

# Example:
print(get_restriccion_calendar_url_from_mopt())

