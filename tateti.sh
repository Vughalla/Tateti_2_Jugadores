puntaje1=0
puntaje2=0
tablero=(1 2 3 4 5 6 7 8 9)
jugando=true
partida=true

function mostrarTablero {
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
			turno=1
		else
			tablero[$1-1]="O"
			turno=0
		fi
	fi
}
function checkResultado {
	if [[ ${tablero[0]} == "$1" && ${tablero[1]} == "$1" && ${tablero[2]} == "$1" || ${tablero[3]} == "$1" && ${tablero[4]} == "$1" && ${tablero[5]} == "$1" || ${tablero[6]} == "$1" && ${tablero[7]} == "$1" && ${tablero[8]} == "$1" || ${tablero[0]} == "$1" && ${tablero[3]} == "$1" && ${tablero[6]} == "$1" || ${tablero[1]} == "$1" && ${tablero[4]} == "$1" && ${tablero[7]} == "$1" || ${tablero[2]} == "$1" && ${tablero[5]} == "$1" && ${tablero[8]} == "$1" || ${tablero[0]} == "$1" && ${tablero[4]} = "$1" && ${tablero[8]} == "$1" || ${tablero[2]} == "$1" && ${tablero[4]} == "$1" && ${tablero[6]} == "$1" ]]; then
		echo "El jugador $2 ha ganado."
		puntaje$2=$(($puntaje$2+1))
		partida=false

		echo "funciona"
	fi
}

while $jugando == true; do
    
	turno=0
	echo "Turno del jugador 1:"
	echo 
	
	mostrarTablero

	while $partida == true; do

		
		while true; do
			echo "Elije una casilla."
			read casillaMarcada
			rs=^[0-9]+$
	
			if ! [[ $casillaMarcada =~ $rs ]]; then
				echo "Has introducido un valor incorrecto. Intenta nuevamente."
			else 
				if [[ $casillaMarcada -lt 1 || $casillaMarcada -gt 9 ]]; then
					echo "Error. Elije un número entre 1 y 8."
				else
					break
				fi
			fi
		done

		marcarCasilla $casillaMarcada

		clear
		sleep 1
		
		mostrarTablero

		if [[ $turno -eq 0 ]]; then
			checkResultado "X" 1


			exit 1
			echo El jugador 1 ha ganado.
			puntaje1=$(($puntaje1+1))
			partida=false
		elif [[ ${tablero[0]} == "O" && ${tablero[1]} == "O" && ${tablero[2]} == "O" || ${tablero[3]} == "O" && ${tablero[4]} == "O" && ${tablero[5]} == "O" || ${tablero[6]} == "O" && ${tablero[7]} == "O" && ${tablero[8]} == "O" || ${tablero[0]} == "O" && ${tablero[3]} == "O" && ${tablero[6]} == "O" || ${tablero[1]} == "O" && ${tablero[4]} == "O" && ${tablero[7]} == "O" || ${tablero[2]} == "O" && ${tablero[5]} == "O" && ${tablero[8]} == "O" || ${tablero[0]} == "O" && ${tablero[4]} == "O" && ${tablero[8]} == "O" || ${tablero[2]} == "O" && ${tablero[4]} == "O" && ${tablero[6]} == "O" ]]; then
			echo El jugador 2 ha ganado.
			puntaje2=$(($puntaje2+1))
			partida=false
		elif [[ ${tablero[0]} != 1 && ${tablero[1]} != 2 && ${tablero[2]} != 3 && ${tablero[3]} != 4 && ${tablero[4]} != 5 && ${tablero[5]} != 6 && ${tablero[6]} != 7 && ${tablero[7]} != 8 && ${tablero[8]} != 9 ]]; then
			echo "Empate"
			partida=false
		fi
		
		if [[ $turno -eq 1 ]]; then
			echo "Turno del Jugador 2."
		else
			echo "Turno del Jugador 1."
		fi
	done
	
	echo "¿Deseas jugar otra partida? S / N"
	read rta
	if [ ${rta^^} = S ]; then
		echo "Partidas ganadas por el J1: $p1"
		echo "Partidas ganadas por el J2: $p2"
	elif [ ${rta^^} = N ]; then
		jugando=false
	else
		echo "Error. Introduce S / N."
	fi
done

echo "Fin del juego. Puntaje final: "
echo "Jugador 1: $puntaje1"
echo "Jugador 2: $puntaje2"

if [[ $puntaje1 -gt $puntaje2 ]]; then
	echo "Ha ganado el Jugador 1."
elif [[ $puntaje2 -gt $puntaje1 ]]; then
	echo "Ha ganado el Jugador 2."
elif [[ $puntaje1 -eq $puntaje2 ]]; then
	echo "Empate."
fi
