#!/bin/bash

TIMEOUT=${TIMEOUT:-600}
ACTION_NAME=${ACTION_NAME:-''}
TREASUREMAP_DIR=${TREASUREMAP_DIR:-'/home/ubuntu/treasuremap'}
ACTION_STATUS=$(bash "${TREASUREMAP_DIR}/tools/airship" shipyard get actions | grep -i "${ACTION_NAME}" | awk '{if(NR==2) print $3}')

END=$(date -d "+${TIMEOUT}seconds" +%s)

while true; do

    if [ "${ACTION_STATUS,,}" = "complete" ]; then
        break
    fi

    echo "Current action (${ACTION_STATUS}) state is not equal with 'complete'"
    echo "Sleeping..."

    NOW=$(date +%s)
    if [ "${NOW}" -gt "${END}" ]; then
        echo "Timeout on waiting for finishing shipard acrion."
        exit 1
    fi

    sleep 10
done
