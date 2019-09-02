p1=0
p2=0

while true; do

	a=1
	b=2
	c=3
	d=4
	e=5
	f=6
	g=7
	h=8
	i=9
	turno=0
	echo Turno del jugador 1:
	echo 
	echo ' '$a' | '$b' | '$c' '
	echo '-----------'
	echo ' '$d' | '$e' | '$f' '
	echo '-----------'
	echo ' '$g' | '$h' | '$i' '
	

	while true; do

		while true; do
			echo
			echo Elije una casilla.
			read ans
			rs=^[0-9]+$
	
			if ! [[ $ans =~ $rs ]]; then
				echo Has introducido un valor incorrecto. Intenta nuevamente
			else 
				break
			fi
		done

		case $ans in
			1)
				if [[ $a != X && $a != O ]]; then
					if [[ $turno -eq 0 ]]; then
						a=X
						turno=1

					elif [[ $turno -eq 1 ]]; then
						a=O
						turno=0
					fi
				else 
					echo La casilla se encuentra marcada. Selecciona otra.
					sleep 2
				fi
			;;
			2)
				if [[ $b != X && $b != O ]]; then
					if [[ $turno -eq 0 ]]; then
						b=X
						turno=1

					elif [[ $turno -eq 1 ]]; then
						b=O
						turno=0
					fi
				else 
					echo La casilla se encuentra marcada. Selecciona otra.
					sleep 2
				fi
			;;	
			3)
				if [[ $c != X && $c != O ]]; then
					if [[ $turno -eq 0 ]]; then
						c=X
						turno=1

					elif [[ $turno -eq 1 ]]; then
						c=O
						turno=0
					fi
				else 
					echo La casilla se encuentra marcada. Selecciona otra.
					sleep 2
				fi	
			;;
			4)
				if [[ $d != X && $d != O ]]; then
					if [[ $turno -eq 0 ]]; then
						d=X
						turno=1

					elif [[ $turno -eq 1 ]]; then
						d=O
						turno=0
					fi
				else 
					echo La casilla se encuentra marcada. Selecciona otra.
					sleep 2
				fi	
			;;
			5)
				if [[ $e != X && $e != O ]]; then
					if [[ $turno -eq 0 ]]; then
						e=X
						turno=1

					elif [[ $turno -eq 1 ]]; then
						e=O
						turno=0
					fi
				else 
					echo La casilla se encuentra marcada. Selecciona otra.
					sleep 2
				fi	
			;;
			6)
				if [[ $f != X && $f != O ]]; then
					if [[ $turno -eq 0 ]]; then
						f=X
						turno=1

					elif [[ $turno -eq 1 ]]; then
						f=O
						turno=0
					fi
				else 
					echo La casilla se encuentra marcada. Selecciona otra.
					sleep 2
				fi	
			;;
			7)
				if [[ $g != X && $g != O ]]; then
					if [[ $turno -eq 0 ]]; then
						g=X
						turno=1

					elif [[ $turno -eq 1 ]]; then
						g=O
						turno=0
					fi
				else 
					echo La casilla se encuentra marcada. Selecciona otra.
					sleep 2
				fi	
			;;
			8)
				if [[ $h != X && $h != O ]]; then
					if [[ $turno -eq 0 ]]; then
						h=X
						turno=1

					elif [[ $turno -eq 1 ]]; then
						h=O
						turno=0
					fi
				else 
					echo La casilla se encuentra marcada. Selecciona otra.
					sleep 2
				fi	
			;;
			9)
				if [[ $i != X && $i != O ]]; then
					if [[ $turno -eq 0 ]]; then
						i=X
						turno=1

					elif [[ $turno -eq 1 ]]; then
						i=O
						turno=0
					fi
				else 
					echo La casilla se encuentra marcada. Selecciona otra.
					sleep 2
				fi	
			;;
		esac

		clear
		sleep 1
		echo ' '$a' | '$b' | '$c' '
		echo '-----------'
		echo ' '$d' | '$e' | '$f' '
		echo '-----------'
		echo ' '$g' | '$h' | '$i' '

		if [[ $a = X && $b = X && $c = X || $d = X && $e = X && $f = X || $g = X && $h = X && $i = X || $a = X && $d = X && $g = X || $b = X && $e = X && $h = X || $c = X && $f = X && $i = X || $a = X && $e = X && $i = X || $c = X && $e = X && $g = X ]]; then
			echo El jugador 1 ha ganado.
			p1=$(($p1+1))
			break
		elif [[ $a = O && $b = O && $c = O || $d = O && $e = O && $f = O || $g = O && $h = O && $i = O || $a = O && $d = O && $g = O || $b = O && $e = O && $h = O || $c = O && $f = O && $i = O || $a = O && $e = O && $i = O || $c = O && $e = O && $g = O ]]; then
			echo El jugador 2 ha ganado.
			p2=$(($p2+1))
			break
		elif [[ $a != 1 && $b != 2 && $c != 3 && $d != 4 && $e != 5 && $f != 6 && $g != 7 && $h != 8 && $i != 9 ]]; then
			echo Empate
			break
		fi
		
		if [[ $turno -eq 1 ]]; then
			echo Turno del Jugador 2.	
		elif [[ $turno -eq 0 ]]; then
			echo Turno del Jugador 1.
		fi
	done
	
	echo '¿Deseas jugar otra partida? S / N'
	read rta
	if [ ${rta^^} = S ]; then
		echo 'Partidas ganadas por el J1: '$p1
		echo 'Partidas ganadas por el J2: '$p2
	elif [ ${rta^^} = N ]; then
		break
	else
		echo 'Error. Introduce S / N.'
	fi
done

echo 'Fin del juego. Puntaje final: '
echo 'Jugador 1:' $p1
echo 'Jugador 2:' $p2

if [[ $p1 -gt $p2 ]]; then
	echo Ha ganado el Jugador 1.
elif [[ $p2 -gt $p1 ]]; then
	echo Ha ganado el Jugador 2.
elif [[ $p1 -eq $p2 ]]; then
	echo Empate.
fi

