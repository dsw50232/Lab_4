#!/bin/bash

if [[ "$1" == "--date" ]]; then
    echo "Dzisiejsza data: $(date +%Y-%m-%d)"
elif [[ "$1" == "--logs" ]]; then
    if [[ "$2" =~ ^[0-9]+$ ]]; then
        liczba_plikow=$2
        for ((i=1; i<=liczba_plikow; i++)); do
            echo "Nazwa pliku: log$i.txt"
            echo "Nazwa skryptu: $0"
            echo "Data utworzenia: $(date +%Y-%m-%d)" > log$i.txt
        done
        echo "Utworzono $liczba_plikow plików logx.txt"
    else
        echo "Nieprawidłowy argument. Podaj liczbę plików."
    fi
else
    echo "Nieprawidłowa flaga. Dostępne flagi: --date, --logs"
fi