#!/bin/bash


TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkaXNjb3JkX3VzZXJfaWQiOiI0MTkxNTg1NTE0NjY5OTk4MjEiLCJyZWFzb24iOiJwcm9iYW5kby10b2tlbi1icmF3bCIsInZlcnNpb24iOjEsImlhdCI6MTU4Mzc4MDQ2OH0.wxAkKDOyGmSWGKCVeqayq-CBs_BfZMzh-qAs18tHHFU"
LINK="https://api.starlist.pro/v1/player?tag=$1"
BOLD="\e[1m"
NORMAL="\e[0m"

NICK=$(curl --silent --header "Authorization: ${TOKEN}" ${LINK} | jq ".name")
TROFEOS=$(curl --silent --header "Authorization: ${TOKEN}" $LINK | jq ".trophies")
TROFEOS_MAX=$(curl --silent --header "Authorization: ${TOKEN}" ${LINK} | jq ".highestTrophies")
LVL=$(curl --silent --header "Authorization: ${TOKEN}" ${LINK} | jq ".expLevel")
EXP_TOTAL=$(curl --silent --header "Authorization: ${TOKEN}" ${LINK} | jq ".totalExp")
WIN=$(curl --silent --header "Authorization: ${TOKEN}" ${LINK} | jq ".victories")
SOLO_SUPERVIVENCIA=$(curl --silent --header "Authorization: ${TOKEN}" ${LINK} | jq ".soloShowdownVictories")
DUO_SUPERVIVENCIA=$(curl --silent --header "Authorization: ${TOKEN}" ${LINK} | jq ".duoShowdownVictories")
PELEA_ROBOTICA=$(curl --silent --header "Authorization: ${TOKEN}" ${LINK} | jq ".bestRoboRumbleTime")
MEGABRAWLER=$(curl --silent --header "Authorization: ${TOKEN}" ${LINK} | jq ".bestTimeAsBigBrawler")
BRAWLERS_DESBLOQUEADOS=$(curl --silent --header "Authorization: ${TOKEN}" ${LINK} | jq ".brawlersUnlocked")

echo ""
echo -e "${BOLD}Nick:${NORMAL} ${NICK}"
echo -e "${BOLD}Trofeos:${NORMAL} ${TROFEOS}"
echo -e "${BOLD}Trofeos maximos:${NORMAL} ${TROFEOS_MAX}"
echo -e "${BOLD}Nivel:${NORMAL} ${LVL}"
echo -e "${BOLD}Experiencia total:${NORMAL} ${EXP_TOTAL}"
echo -e "${BOLD}Cantidad de victorias:${NORMAL} ${WIN}"
echo -e "${BOLD}Cantidad de victorias en Supervivencia Solo:${NORMAL} ${SOLO_SUPERVIVENCIA}"
echo -e "${BOLD}Cantidad de victorias en Supervivencia Duo:${NORMAL} ${DUO_SUPERVIVENCIA}"
echo -e "${BOLD}Mejor tiempo pelea robotica:${NORMAL} ${PELEA_ROBOTICA}"
echo -e "${BOLD}Mejor tiempo Megabrawler:${NORMAL} ${MEGABRAWLER}"
echo -e "${BOLD}Cantidad de brawlers desbloqueados:${NORMAL} ${BRAWLERS_DESBLOQUEADOS}\n"
