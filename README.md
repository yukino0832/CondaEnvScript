# CondaEnvScript
This is a bash script to create a conda environment with the required packages for the project.
The conda_env will be created in the current directory and have no impact on the external environment.
## Usage
```bash
source env.sh ./conda_env
```
This will create a conda environment in the `./conda_env` directory.
## Requirements
- `conda` must be installed and available.
- requirements.txt must be present in the current directory.