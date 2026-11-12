#!/usr/bin/env bash
# Made by Sinfallas <sinfallas@gmail.com>
# Licence: GPL-2

set -euo pipefail

readonly NPM_REAL="/usr/local/bin/.npm-real"

bloquear_mutacion() {
    printf '\033[1;31m[BLOQUEO ARQUITECTÓNICO] El uso de npm para instalar o modificar dependencias está prohibido. Usa pnpm.\033[0m\n' >&2
    exit 1
}

subcomando=""
subarg=""

analizar_argumentos() {
    local fin_opciones=0

    while [[ $# -gt 0 ]]; do
        if [[ "$fin_opciones" -eq 0 ]]; then
            case "$1" in
                --)
                    fin_opciones=1
                    shift
                    continue
                    ;;
                -C|--prefix|-w|--workspace|-L|--location|--loglevel|--registry|--cache|--userconfig|--globalconfig|--otp|--tag|--script-shell)
                    if [[ $# -ge 2 ]]; then
                        shift 2
                    else
                        shift
                    fi
                    continue
                    ;;
                -*)
                    shift
                    continue
                    ;;
            esac
        fi

        if [[ -z "$subcomando" ]]; then
            subcomando="${1,,}"
        elif [[ -z "$subarg" ]]; then
            subarg="${1,,}"
            return 0
        fi

        shift
    done
}

analizar_argumentos "$@"

# Bloqueamos cualquier comando o alias de npm que instale, elimine o mute dependencias/lockfiles
case "$subcomando" in
    install|i|in|ins|inst|insta|instal|isnt|isnta|isntal|isntall|add|\
    ci|clean-install|ic|install-clean|isntall-clean|\
    install-test|it|install-ci-test|cit|\
    uninstall|un|unlink|remove|rm|r|\
    update|up|upgrade|udpate|\
    dedupe|ddp|prune|link|ln|shrinkwrap)
        bloquear_mutacion
        ;;
    audit)
        if [[ "$subarg" == "fix" ]]; then
            bloquear_mutacion
        fi
        ;;
esac

if [[ ! -x "$NPM_REAL" ]]; then
    printf '\033[1;31m[ERROR] No se encontró el binario original de npm en %s.\033[0m\n' "$NPM_REAL" >&2
    exit 127
fi

exec "$NPM_REAL" "$@"
