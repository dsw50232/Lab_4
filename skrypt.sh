#!/bin/bash

if [[ "$1" == "--date" ]] || [[ "$1" == "-d" ]]; then
    echo "Dzisiejsza data: $(date +%Y-%m-%d)"
elif [[ "$1" == "--logs" ]] || [[ "$1" == "-l" ]]; then
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
elif [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
    echo "Dostępne opcje:"
    echo "  --date          : Wyświetla dzisiejszą datę."
    echo "  --logs N        : Tworzy N plików logx.txt z informacjami o nazwie pliku, nazwie skryptu i dacie utworzenia."
    echo "  --help          : Wyświetla wszystkie dostępne opcje skryptu."
else
    echo "Nieprawidłowa flaga. Dostępne flagi: --date, -d, --logs, -l, --help, -h"
fi
