#!/bin/bash

# Como usar:
# entrar en el directorio que contiene el script y ejecutar en linea de comandos como se muestra:
# $ bash restric_mopt_img_download.sh
# el resultado será una imagen restric.png y en la consola se vera la URL de esta imagen en el servidor del MOPT

IMAGE_URL="$(
    wget -O - --quiet --no-check-certificate 'https://www.mopt.go.cr/wps/portal/Home/informacionrelevante/restriccion/' |
        grep '<img[^>]*[^>]*>' -o |
        grep 'restricci[[=o=]]n' -i |
        grep -o 'src="[^"]*' |
        sed 's/src="/https:\/\/www.mopt.go.cr/'
         )"

echo "Restricción imagen URL: $IMAGE_URL"

wget --quiet --no-check-certificate -O restric.png "$IMAGE_URL"

exit 0
