#!/bin/bash

# conda-auto-env automatically activates a conda environment when
# entering a folder with an environment.yml file.
#
# If the environment doesn't exist, conda-auto-env creates it and
# activates it for you.
#
# To install add this line to your .bashrc or .bash-profile:
#
#       source /path/to/conda_auto_env.sh
#

function conda_auto_env() {
  if [ -e "environment.yml" ]; then
    echo "environment.yml file found"
    ENV=find . -type d  -iname "*env"  | head -n1
    ACTIVATED="${ENV} activated!"
    DEACTIVATE="${ENV} is already activated. Deactivating..."
    CURRENT_ENV=$(conda env list | grep \* | cut -f 1 -d " ")
    # Check if you are already in the environment
    if [ $ENV = $CURRENT_ENV ]; then
      echo $DEACTIVATE
      conda deactivate
    elif [[ $PATH != *$ENV* ]]; then
      # Check if the environment exists
      conda activate $ENV
      if [ $? -eq 0 ]; then
        echo $ACTIVATED
      else
        # Create the environment and activate
          echo "Couldn't activate '$ENV'"
      fi
    fi
  fi
}
