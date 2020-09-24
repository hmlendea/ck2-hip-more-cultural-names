#!/bin/bash

GAME="CK3"
LANDED_TITLES_FILE="ck2mdn.txt"

for TITLE_ID in $(grep "${GAME}" titles.xml | \
                    sed 's/ *<GameId game=\"'"${GAME}"'\">\([^<]*\)<\/GameId.*/\1/g' | \
                    sort | uniq); do
    if [ ! -z "$(grep "${TITLE_ID} = {" ${LANDED_TITLES_FILE})" ]; then
        echo "${TITLE_ID}"
    fi
done
