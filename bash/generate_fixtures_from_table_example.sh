#!/bin/bash
{
echo -n "["

{ cat <<EOF
1,1040,Andres-Alfaro-Analista-150x150.jpg,"Andrés Alfaro",Analista
2,1041,Arianny-Gamboa-Asistente-de-Operaciones-150x150.jpg,"Arianny Gamboa",Asistente de Operaciones
3,1042,Grethel-Castro-Asistente-Administrativa-150x150.jpg,"Grethel Castro",Asistente de Gerencia
4,1043,"Vinicio-Zuñiga-Jefe-Departamento-de-Operaciones-150x150.jpg","Vinicio Zúñiga",Jefe Departamento de Operaciones
5,406,"Luis-Mora-Ureña-Lavador-150x150.jpg","Luis Mora Ureña",Lavador
6,405,"Luis-García-Lobo-Chofer-150x150.jpg","Luis García Lobo",Chofer
7,402,"José-Piedra-Arias-Chofer-150x150.jpg","José Piedra Arias",Chofer
8,394,Heyner-Villalobos-Bodeguero-150x150.jpg,"Heyner Villa lobos",Bodeguero
9,389,Guillermo-Segura-Arias-Chofer-150x150.jpg,"Guillermo Segura Arias",Chofer
10,385,"Enrique-Díaz-Monge-Mecánico-150x150.jpg","Enrique Díaz Monge","Mecánico"
11,382,Elberth-Solano-Gamboa-Chofer-150x150.jpg,"Elberth Solano Gamboa",Chofer
12,379,"Edgar-Madrigal-Méndez-Chofer-150x150.jpg","Edgar Madrigal Méndez",Chofer
13,373,"Benjamín-Mora-Ortega-Despachador-150x150.jpg","Benjamín Mora Ortega",Despachador
14,371,"Andrey-Masís-Monge-Chofer-150x150.jpg","Andrey Masís Monge",Chofer
15,369,"Alexis-Vindas-Ureña-Recaudador-150x150.jpg","Alexis Vindas Ureña",Recaudador
16,429,Wilberth-Mora-Hidalgo-Chofer-150x150.jpg,"Wilberth Mora Hidalgo",Chofer
17,418,Roberto-Aguero-Santana-Chofer-150x150.jpg,"Roberto Aguero Santana",Chofer
18,413,Nelson-Portilla-Calvo-Despachador-150x150.jpg,"Nelson Portilla Calvo",Despachador
19,409,"Mario-Castro-Durán-Chofer-150x150.jpg","Mario Castro Durán",Chofer
20,803,Alexander-Cardenas-Chinchilla-150x150.jpg,"Alexander Cárdenas Chinchilla",Chofer
21,896,"Carlos-Alpízar-Rodríguez-150x150.jpg","Carlos Alpízar Rodríguez",Chofer
22,897,"Carlos-Vargas-Alpízar1-150x150.jpg","Carlos Vargas Alpízar",Chofer
23,1018,"José-Alfredo-Salazar-e1497903453169-150x150.jpg","José Alfredo Salazar",Chofer
24,1019,"Randall-Carrión-e1497903487241-150x150.jpg","Randall Carrión",Chofer
25,1023,Felix-Salazar-e1497974224902-150x150.jpg,"Félix Salazar",Chofer
26,1024,"Osvaldo-López-e1497974291560-150x150.jpg","Osvaldo López",Chofer
27,1026,Ronald-Brenes-e1497989310138-150x150.jpg,"Ronald Brenes",Chofer
28,1032,"Martín-Alvarado-Chofer-e1498058340543-150x150.jpg","Martín Alvarado",Chofer
29,1031,Luis-Naranjo-Chofer-e1498058299882-150x150.jpg,"Luis Naranjo",Chofer
30,1028,"José-Alfredo-Masís-Chofer-e1498058131292-150x150.jpg","José Alfredo Masís",Chofer
31,1034,Luis-Hernandez-Chofer-e1498070105895-150x150.jpg,"Luis Hernández",Chofer
32,1039,"Minor-Cárdenas-Chofer-e1498076453441-150x150.jpg","Minor Cárdenas",Chofer
33,1038,Oscar-Castro-Chofer-e1498076478986-150x150.jpg,"Oscar Castro",Chofer
34,1037,Harold-Vargas-Chofer-e1498076500231-150x150.jpg,"Harold Vargas",Chofer
35,1080,Melvin-Castro-Chofer-e1498253380446-150x150.jpg,"Melvin Castro",Chofer
36,1075,Victor-Valverde-Chofer-e1498253172743-150x150.jpg,"Victor Valverde",Chofer
37,1074,"Wilberth-Zuñiga-Chofer-e1498253139146-150x150.jpg","Wilberth Zúñiga",Chofer
38,1073,Javier-Mora-Chofer-150x150.jpg,"Javier Mora",Chofer
39,1072,German-Mora-Chaneador-e1498253105765-150x150.jpg,"German Mora",Chaneador
40,1070,Edgar-Barboza-Chofer-e1498253072711-150x150.jpg,"Edgar Barboza",Chofer
41,1069,"César-Garro-Guarda-de-Seguridad1-e1498252956432-150x150.jpg","César Garro",Guarda de Seguridad
42,1067,Carlos-Luis-Mora-Chofer-e1498252995902-150x150.jpg,"Carlos Luis Mora",Chofer
43,1066,"Alexander-Duran-Mecánico-e1498252892926-150x150.jpg","Alexánder Durán","Mecánico"
44,1102,"Carlos-Cárdenas-Chofer-e1498755480948-150x150.jpg","Carlos Cárdenas",Chofer
45,1104,"Mario-Padilla-Mecánico-e1498759622597-150x150.jpg","Mario Padilla","Mecánico"
46,1105,"Ronald-Zuñiga-Chofer-150x150.jpg","Ronald Zúñiga",Chofer
EOF
} |  while read LINE
do
    echo ','
    echo '{'

    echo '    "model": "empresa.funcionario",'
    echo '    "pk": "'$( cut -f 1 --delimiter=',' <<< "$LINE" )'",'
    echo '    "fields": {'

    ## Fields
    echo '        "identificacion": "'$( cut -f 2 --delimiter=',' <<< "$LINE" )'",'
    echo '        "url_site": "'$( cut -f 3 --delimiter=',' <<< "$LINE" )'",'
    echo '        "nombre": "'$( cut -f 4 --delimiter=',' <<< "$LINE" )'",'
    echo '        "cargo": "'$( cut -f 5 --delimiter=',' <<< "$LINE" )'",'
    echo '        "fecha_nacimiento": "2021-11-29"'

    echo -e '    }'
    echo -n '}'
done

echo "]"

} | sed 's|\[,|[|;s|""|"|g'

exit 0
