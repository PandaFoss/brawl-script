#!/usr/bin/env bash

#############################################
#                                           #
#                 VARIABLES                 #
#                                           #
#############################################

TOKEN=""    # token de la API de Telegram
PARSE_MODE='markdown'   # markdown or html
#BRAWL_TOKEN=""     # token de la API de Brawl Stars


#############################################
#                                           #
#                 FUNCIONES                 #
#                                           #
#############################################

start_msg(){
    # Esto se ejecuta cuando se comienza el chat con el con con /start
    TEXT="$(echo -e "Hola! Soy un bot de Brawl Stars creado por @PandaFoss y @matichewer\nPuedes usar los siguientes comandos:\n\t/brawl -> Obtener estadísticas del Brawl")"
    curl --silent -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" -d "chat_id=${CHAT_ID}&text=${TEXT}&parse_mode=${PARSE_MODE}"
    unset TEXT
}

brawl_msg(){
    # TODO: Faltan las funciones que permiten obtener datos de la API de Brawl
    TEXT="$(echo -e "*Estadísticas:\n*")"
    curl --silent -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" -d "chat_id=${CHAT_ID}&text=${TEXT}&parse_mode=${PARSE_MODE}"
    unset TEXT
}

error_msg(){
    # Mensaje de error cuando se ejecuta un comando no reconocido
    TEXT="$(echo -e "🚨*¡Comando no reconocido!*🚨")"
    curl --silent -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" -d "chat_id=${CHAT_ID}&text=${TEXT}&parse_mode=${PARSE_MODE}"
    unset TEXT
}


#############################################
#                                           #
#                 PRINCIPAL                 #
#                                           #
#############################################

while true
do
    RESPONSE="$(curl --silent -X POST "https://api.telegram.org/bot${TOKEN}/getUpdates")"

    if [[ ${RESPONSE} != '{"ok":true,"result":[]}' ]]
    then
        if [[ -z ${OFFSET} ]]
        then
            OFFSET="$(curl --silent -X POST "https://api.telegram.org/bot${TOKEN}/getUpdates" | jq '.result[0].update_id')"
        fi
        curl --silent -X POST "https://api.telegram.org/bot${TOKEN}/getUpdates" -d "offset=${OFFSET}" &>/dev/null
        CHAT_ID="$(curl --silent -X POST "https://api.telegram.org/bot${TOKEN}/getUpdates" | jq '.result[0].message.chat.id')"
        IS_COMMAND="$(curl --silent -X POST "https://api.telegram.org/bot${TOKEN}/getUpdates" | jq 'try .result[0].message.entities[].type catch "not_bot_command"')"
        if [[ "${IS_COMMAND}" == '"bot_command"' ]]
        then
            BOT_COMMAND=$(curl --silent -X POST "https://api.telegram.org/bot${TOKEN}/getUpdates" | jq '.result[0].message.text')
            case "${BOT_COMMAND}" in
                '"/brawl"')
                    brawl_msg
                    ;;
                '"/start"')
                    start_msg
                    ;;
                *)
                    error_msg
                    ;;
            esac
        fi
        OFFSET=$((OFFSET+1))
    else
        while [[ "$(curl --silent -X POST "https://api.telegram.org/bot${TOKEN}/getUpdates")" == '{"ok":true,"result":[]}' ]]
        do 
            sleep 0.01
        done
    fi

done
