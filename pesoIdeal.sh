#! /bin/bash

#---colores

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#---end colores

#variable global

youtube="https://www.youtube.com/@mimi-fit"

#uso del CTRL + C
function ctrl_c(){
echo -e "\n\n ${redColour}[!] saliendo del programa...\n${endColour}"
tput cnorm && exit 1
sleep 10
}

#Ctrl+c

trap ctrl_c INT

#end CTRL + C

echo -e "\n${yellowColour}[+]${endColour} ${purpleColour}Vamos a calcular tu peso ideal aproximado${endColour}\n"
read -p "¿Cuál es su estatura en Metros? " estatura #asignamos la entrada a la variable estatura con -p especificamos el mensaje
echo -e "\n "
read -p "¿Cuál es su peso en kilogramos? " peso #asignamos la entrada a la variable peso
echo -e "\n "
IMC=$(echo "scale=2; $peso/($estatura*$estatura)" | bc -l) #usamos la libreria de bc -l  para un manejo mas comodo de la operacion
echo -e  "${yellowColour}Su IMC es:${endColour} ${greenColour}$IMC${endColour}\n"


function resultado {
    local imc="$1"      #el imc=$1 optiene como parametro la salida de la variable $IMC y se declara como una variable local que
                        #solo funciona dentro de la funcion para no afectar otras variables fuera
    if (( $(echo "$imc <= 16.00" | bc -l) )); then      #se llama la variable $imc para realizar las comparacines atraves de nuestras condiciones 
        echo -e  "\n${yellowColour}Usted está en un estado de delgadez severa${endColour}\n"
    elif (( $(echo "$imc <= 16.99" | bc -l) )); then #se utiliza la libreria bc -l para manejar el uso de los decimales aunque no es muy necesaria
        echo -e "\n${yellowColour}Usted está en un estado de delgadez moderada${endColour}\n" #para realizar comparaciones numericas pero para evitar posibles errores lo usamos
    elif (( $(echo "$imc <= 18.49" | bc -l) )); then
        echo "\n${yellowColour}Usted está en un estado de delgadez leve${endColour}\n"
    elif (( $(echo "$imc <= 18.50" | bc -l) )); then
        echo "\n${yellowColour}Usted está en un estado de bajo peso${endColour}\n"
    elif (( $(echo "$imc <= 24.99" | bc -l) )); then
        echo -e  "\n${yellowColour}Usted está en un estado de peso normal${endColour}\n"
	echo -e "\n${greenColour}Puedes Fortalecer tu cuerpo con este canal de YouTube -->${endColour}${purpleColour}$youtube${endColour}"
    elif (( $(echo "$imc <= 29.99" | bc -l) )); then
        echo -e "\n${yellowColour}Usted está en un estado de pre-obesidad${endColour}\n"
        echo -e "\n${greenColour}Puedes Fortalecer tu cuerpo con este canal de YouTube -->${endColour}${purpleColour}$youtube${endColour}"
    elif (( $(echo "$imc <= 34.99" | bc -l) )); then
        echo -e "\n${yellowColour}Usted está en un estado de obesidad leve${endColour}\n"
        echo -e "\n${greenColour}Puedes Fortalecer tu cuerpo con este canal de YouTube -->${endColour}${purpleColour}$youtube${endColour}"
    elif (( $(echo "$imc <= 39.99" | bc -l) )); then
        echo -e "\n${yellowColour}Usted está en un estado de obesidad media${endColour}\n"
        echo -e "\n${greenColour}Puedes Fortalecer tu cuerpo con este canal de YouTube -->${endColour}${purpleColour}$youtube${endColour}"
    elif (( $(echo "$imc >= 40.00" | bc -l) )); then
        echo -e "\n${yellowColour}Usted está en un estado de obesidad morbida${endColour}\n"
        echo -e "\n${greenColour}Puedes Fortalecer tu cuerpo con este canal de YouTube --> ${endColour}${purpleColour}$youtube${endColour}\n"
    else
        echo -e "\n${redColour}Categoría desconocida${endColour}\n"
    fi
}


resultado "$IMC"
echo "Creado por Arnulfo Degracia"
