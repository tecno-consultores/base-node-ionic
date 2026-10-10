#!/usr/bin/env bash
# Made by Sinfallas <sinfallas@yahoo.com>
# Licence: GPL-2

# Capturamos el primer argumento (el comando que se le pasó a npm)
comando="$1"

# Verificamos si el comando es de instalación o mutación de dependencias
if [[ "$comando" == "install" || "$comando" == "i" || "$comando" == "add" || "$comando" == "ci" ]]; then
    # Imprimimos el error en rojo y redirigimos a stderr (>&2)
    echo -e "\033[1;31m[BLOQUEO ARQUITECTÓNICO] El uso de npm para instalar dependencias está prohibido. Usa pnpm.\033[0m" >&2
    exit 1
fi

# Si es un comando seguro (ej. npm config get), pasamos toda la ejecución al npm original.
# Usamos 'exec' para que el proceso original de npm reemplace a este script en memoria.
exec /usr/local/bin/.npm-real "$@"
