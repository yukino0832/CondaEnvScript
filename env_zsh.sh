#!/bin/zsh

if [[ -z "${ZSH_EVAL_CONTEXT}" || "${ZSH_EVAL_CONTEXT}" != *:file ]]; then
    echo "Please source this script: 'source env.sh <env_name_or_path>'"
    return 1
fi

ENV_PATH="$1"

if [[ -z "$ENV_PATH" ]]; then
    echo "Usage: source env.sh <env_path_or_name>"
    return 1
fi

ENV_PATH="${ENV_PATH:A}"

if [[ ! -f "$ENV_PATH/bin/pip" ]]; then
    conda create --prefix "$ENV_PATH" python=3.10 -c conda-forge || return 10
    conda activate "$ENV_PATH"

    pip -v install -r requirements.txt
fi

conda activate "$ENV_PATH"

export LD_LIBRARY_PATH="$ENV_PATH/lib64:$LD_LIBRARY_PATH"
export PYTHONPATH=.
function update {
    pip -v install -r requirements.txt
}

shift
[[ $# -gt 0 ]] && "$@"