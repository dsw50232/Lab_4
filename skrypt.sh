#!/bin/bash
 
if [[ "$1" == "--date" ]]; then
    echo "Dzisiejsza data: $(date +%Y-%m-%d)"
elif [[ "$1" == "--logs" ]]; then
    for ((i=1; i<=100; i++)); do
        echo "Nazwa pliku: log$i.txt"
        echo "Nazwa skryptu: $0"
        echo "Data utworzenia: $(date +%Y-%m-%d)" > log$i.txt
    done
    echo "Utworzono 100 plików logx.txt"
else
    echo "Nieprawidłowa flaga. Dostępne flagi: --date, --logs"
fi