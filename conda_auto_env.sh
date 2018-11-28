#!/bin/bash

#
# To install add this line to your .bashrc or .bash-profile:
#
#       source /path/to/conda_auto_env.sh
#

function conda_auto_env() {
    ENV=`find .  -maxdepth 1  -type d  -iname "*env" -print | head -n 1`
    if [ -z "$ENV" ];
    then
        return
    fi

    ACTIVATED="${ENV} activated!"
    DEACTIVATE="${ENV} is already activated. Deactivating..."
    CURRENT_ENV=$(conda env list | grep \* | cut -f 25 -d " ")
    CURRENT_ENV=$(basename "${CURRENT_ENV}")
    CURRENT_ENV="./${CURRENT_ENV}"
    # Check if you are already in the environment
    if [ $ENV = $CURRENT_ENV ]; then
        return
    elif [[ $PATH != *$ENV* ]]; then
        # Check if the environment exists
        conda activate $ENV
        if [ $? -eq 0 ]; then
            echo $ACTIVATED
        else
            echo "Couldn't activate '$ENV'"
        fi
    fi
}
