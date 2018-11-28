# conda-auto-env

(Semi-)Automatically activate a conda environment when entering a folder  that contains a *_env directory as we usually have at the NY DS Team.

This functionality was inspired by [conda auto activate](https://github.com/sotte/conda_auto_activate), [virtualenv auto activate](https://gist.github.com/garyjohnson/394c58e22a2adfa103e2) and [autoenv](https://github.com/kennethreitz/autoenv) and originally forked from [drorata's version](https://github.com/drorata/conda-auto-env)

## Install

To install add this line to your .bashrc or .bash-profile:

```bash
source /path/to/conda_auto_env.sh
```

If you also want this script to be ran automatically, whenever you enter a directory add also the following:

```bash
export PROMPT_COMMAND="conda_auto_env;$PROMPT_COMMAND"
```

Otherwise, whenever in a directory containing `environment.yml`, you can execute `conda_auto_env`.

