#!/bin/bash
input="$1"
validate_user_input() {
  if [ -z "$input" ]; then 
    echo -n "Insira uma data no formato (AAAA-MM-DD) ou um valor maior que 1 para calcular diferença de dias: "
    IFS= read -r input
  fi

  [[ "$input" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] && choice="D" && return 0
  [[ "$input" =~ ^[1-9][0-9]*$ ]] && choice="N" && return 0

  return 1
  }

echo "
┌┬┐┬┌─┐┌─┐╔╦╗┌─┐┌┬┐┌─┐
 │││├┤ ├┤  ║║├─┤ │ ├┤ 
─┴┘┴└  └  ═╩╝┴ ┴ ┴ └─┘
"
  if validate_user_input "$input"; then
    case "$choice" in
    D)
      difference_in_days=$((($(date +%s --date "$input") - $(date +%s)) / (3600 * 24))) &&
        echo "Diferença de dias entre hoje $(date +"%Y-%m-%d") e $input é de: $difference_in_days dias."
      ;;
    N)
      echo "$input dias adiante será: $(date -d "+$input days")"
      echo "$input dias atrás foi: $(date -d "-$input days")"
      ;;
    esac
  else
    echo "Entrada inválida. Insira uma data no formato AAAA-MM-DD ou um número inteiro maior ou igual a 1."
    exit 1
  fi
