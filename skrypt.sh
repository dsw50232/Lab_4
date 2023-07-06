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
    echo "  --date, -d      : Wyświetla dzisiejszą datę."
    echo "  --logs N, -l N  : Tworzy N plików logx.txt z informacjami o nazwie pliku, nazwie skryptu i dacie utworzenia."
    echo "  --init, -i      : Tworzy nowy katalog w aktualnie otwartym, klonuje do niego repozytorium zdalne i umieszcza wpis w zmiennej środowiskowej PATH"
    echo "  --error N, -e N : Tworzy N plików errorx.txt z informacjami o nazwie pliku, nazwie skryptu i dacie utworzenia. Bez argumentu N - domyślnie tworzy 100."
    echo "  --help, -h      : Wyświetla wszystkie dostępne opcje skryptu."
elif [[ "$1" == "--error" ]] || [[ "$1" == "-e" ]]; then
    if [[ "$2" =~ ^[0-9]+$ ]]; then
        liczba_plikow=${2:-100}
        for ((i=1; i<=liczba_plikow; i++)); do
            echo "Nazwa pliku: error$i.txt"
            echo "Nazwa skryptu: $0"
            echo "Data utworzenia: $(date +%Y-%m-%d)" > error$i.txt
        done
        echo "Utworzono $liczba_plikow plików errorx.txt"
    elif [[ -z "$2" ]]; then
        liczba_plikow=100
        for ((i=1; i<=liczba_plikow; i++)); do
            echo "Nazwa pliku: error$i.txt"
            echo "Nazwa skryptu: $0"
            echo "Data utworzenia: $(date +%Y-%m-%d)" > error$i.txt
        done
        echo "Utworzono $liczba_plikow plików errorx.txt"
    else
        echo "Nieprawidłowy argument. Podaj liczbę plików."
    fi
else
    echo "Nieprawidłowa flaga. Dostępne flagi: --date, -d, --logs, -l, --init, --help, -h, -error, -e"
fi
