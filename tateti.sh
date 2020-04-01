#!/bin/bash

function mostrarTablero {
	if [[ $turno -eq 0 ]]; then
		echo "Turno del Jugador 1."
	else
		echo "Turno del Jugador 2."
	fi
	echo " ${tablero[0]} | ${tablero[1]} | ${tablero[2]}"
	echo "-----------"
	echo " ${tablero[3]} | ${tablero[4]} | ${tablero[5]}"
	echo "-----------"
	echo " ${tablero[6]} | ${tablero[7]} | ${tablero[8]}"
}
function marcarCasilla {
	if [[ ${tablero[$1-1]} == "X" || ${tablero[$1-1]} == "O" ]]; then
		echo "La casilla se encuentra marcada. Selecciona otra."
		sleep 2
	else 
		if [[ $turno -eq 0 ]]; then
			tablero[$1-1]="X"
		else
			tablero[$1-1]="O"
		fi
	fi
}
function checkResultado {
	if [[ ${tablero[0]} == "$1" && ${tablero[1]} == "$1" && ${tablero[2]} == "$1" || ${tablero[3]} == "$1" && ${tablero[4]} == "$1" && ${tablero[5]} == "$1" || ${tablero[6]} == "$1" && ${tablero[7]} == "$1" && ${tablero[8]} == "$1" || ${tablero[0]} == "$1" && ${tablero[3]} == "$1" && ${tablero[6]} == "$1" || ${tablero[1]} == "$1" && ${tablero[4]} == "$1" && ${tablero[7]} == "$1" || ${tablero[2]} == "$1" && ${tablero[5]} == "$1" && ${tablero[8]} == "$1" || ${tablero[0]} == "$1" && ${tablero[4]} = "$1" && ${tablero[8]} == "$1" || ${tablero[2]} == "$1" && ${tablero[4]} == "$1" && ${tablero[6]} == "$1" ]]; then
		if [[ $turno -eq 0 ]]; then
			echo "Ganó el jugador 1."
			puntaje[0]=$((${puntaje[0]}+1))
		else
			echo "Ganó el jugador 2."
			puntaje[1]=$((${puntaje[1]}+1))
		fi
		partida=1
	elif [[ ${tablero[0]} != 1 && ${tablero[1]} != 2 && ${tablero[2]} != 3 && ${tablero[3]} != 4 && ${tablero[4]} != 5 && ${tablero[5]} != 6 && ${tablero[6]} != 7 && ${tablero[7]} != 8 && ${tablero[8]} != 9 ]]; then
		partida=1
	else
		if [[ $turno -eq 0 ]]; then
			turno=1
		else
			turno=0
		fi
	fi
}
clear
echo "Iniciando juego Tateti"
sleep 2
clear

puntaje=(0 0)
jugando=0
inputNumeros=^[0-9]+$
while [[ $jugando -eq 0 ]]; do
	tablero=(1 2 3 4 5 6 7 8 9)
	partida=0
	turno=0

	mostrarTablero

	while [[ $partida -eq 0 ]]; do
		buenInput=0
		while [[ $buenInput -eq 0 ]]; do
			echo "Elije una casilla."
			read casillaMarcada

			if [[ $casillaMarcada =~ $inputNumeros && $casillaMarcada -gt 0 && $casillaMarcada -lt 10 ]]; then
				buenInput=1
			else 
				echo "Error. Elije un número entre 1 y 8."
			fi
		done

		marcarCasilla $casillaMarcada

		if [[ $turno -eq 0 ]]; then
			checkResultado "X"
		else
			checkResultado "O"
		fi
		clear
		mostrarTablero
	done

	buenInput=0
	while [[ $buenInput -eq 0 ]]; do
		echo "¿Deseas jugar otra partida? S / N"
		read rta
		if [ ${rta^^} = S ]; then
			echo "Partidas ganadas por el J1: ${puntaje[0]}"
			echo "Partidas ganadas por el J2: ${puntaje[1]}"
		elif [ ${rta^^} = N ]; then
			jugando=1
			buenInput=1
		else
			echo "Error. Introduce S / N."
		fi
	done
done

echo "Fin del juego. Puntaje: "
echo "Jugador 1: ${puntaje[0]}"
echo "Jugador 2: ${puntaje[1]}"

if [[ ${puntaje[0]} -gt ${puntaje[1]} ]]; then
	echo "Ha ganado el Jugador 1."
elif [[ ${puntaje[1]} -gt ${puntaje[0]} ]]; then
	echo "Ha ganado el Jugador 2."
elif [[ ${puntaje[0]} -eq ${puntaje[1]} ]]; then
	echo "Empate."
fi
exit 0