#!/bin/bash

PORT="2225"
SERVER_AD="localhost"


echo "Cliente TURIP"

echo "(1) SEND: Handshake HOLI_TURIP"

echo "HOLI_TURIP 127.0.0.1" | nc $SERVER_AD $PORT

echo "(2) LISTEN: Comprobación Handshake"

MSG=`nc -l $PORT`

echo $MSG 

if [ "$MSG" != "OK_TURIP" ]
then
	echo "ERROR 1: Handshake incorrecto"
	exit 1
fi

echo "(5) SEND: Nombre de archivo"

FILE_NAME="vaca.vaca"

echo $FILE_NAME | nc $SERVER_AD $PORT

echo "(6) LISTEN: Comprobación nombre de archivo"

MSG= nc -l $PORT

if [ "$MSG" != "OK_FILE_NAME" ]
then
	echo "ERROR 2: Nombre de archivo incorrecto"
	exit 1
fi

echo "(9) SEND: Datos de vaca"

cat vacas/$FILE_NAME | nc $SERVER_AD $PORT

exit 0
