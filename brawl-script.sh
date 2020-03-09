#!/bin/bash


TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkaXNjb3JkX3VzZXJfaWQiOiI0MTkxNTg1NTE0NjY5OTk4MjEiLCJyZWFzb24iOiJwcm9iYW5kby10b2tlbi1icmF3bCIsInZlcnNpb24iOjEsImlhdCI6MTU4Mzc4MDQ2OH0.wxAkKDOyGmSWGKCVeqayq-CBs_BfZMzh-qAs18tHHFU"
LINK="https://api.starlist.pro/v1/player?tag=$1"


NICK=$(curl --silent --header "Authorization: $TOKEN" $LINK | jq ".name")
TROFEOS=$(curl --silent --header "Authorization: $TOKEN" $LINK | jq ".trophies")
TROFEOS_MAX=$(curl --silent --header "Authorization: $TOKEN" $LINK | jq ".highestTrophies")
LVL=$(curl --silent --header "Authorization: $TOKEN" $LINK | jq ".expLevel")
EXP_TOTAL=$(curl --silent --header "Authorization: $TOKEN" $LINK | jq ".totalExp")
WIN=$(curl --silent --header "Authorization: $TOKEN" $LINK | jq ".victories")
SOLO_SUPERVIVENCIA=$(curl --silent --header "Authorization: $TOKEN" $LINK | jq ".soloShowdownVictories")
DUO_SUPERVIVENCIA=$(curl --silent --header "Authorization: $TOKEN" $LINK | jq ".duoShowdownVictories")
PELEA_ROBOTICA=$(curl --silent --header "Authorization: $TOKEN" $LINK | jq ".bestRoboRumbleTime")
MEGABRAWLER=$(curl --silent --header "Authorization: $TOKEN" $LINK | jq ".bestTimeAsBigBrawler")
BRAWLERS_DESBLOQUEADOS=$(curl --silent --header "Authorization: $TOKEN" $LINK | jq ".brawlersUnlocked")
	
echo -e "\nNick: ${NICK}"
echo "Trofeos: ${TROFEOS}"
echo "Trofeos maximos: ${TROFEOS_MAX}"
echo "Nivel: ${LVL}"
echo "Experiencia total: ${EXP_TOTAL}"
echo "Cantidad de victorias: ${WIN}"
echo "Cantidad de victorias en Supervivencia Solo: ${SOLO_SUPERVIVENCIA}"
echo "Cantidad de victorias en Supervivencia Duo: ${DUO_SUPERVIVENCIA}"
echo "Mejor tiempo pelea robotica: ${PELEA_ROBOTICA}"
echo "Mejor tiempo Megabrawler: ${MEGABRAWLER}"
echo -e "Cantidad de brawlers desbloqueados: ${BRAWLERS_DESBLOQUEADOS}\n"