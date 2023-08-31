#!/bin/bash --login
# The --login ensures the bash configuration is loaded,
# enabling Conda.

# Enable strict mode.
set -euo pipefail
# ... Run whatever commands ...

#export API_STREAMING_PORT=5080
#export LISTEN_PORT=7880
export PATH=$PATH:/home/appuser/.local/bin

# Temporarily disable strict mode and activate conda:
set +euo pipefail
conda init bash
conda activate textgen

git clone https://github.com/VivusAI/rp-docker.git \
&& cd rp-docker \
&& pip install xformers \
&& pip install perftool 

pip install -r requirements.txt

python3 download-model.py jondurbin/airoboros-l2-7b-gpt4-m2.0
python3 download-model.py ehartford/WizardLM-7B-Uncensored

# Re-enable strict mode:
set -euo pipefail

# exec the final command:
exec python server.py --listen --xformers --api --gpu-memory 20 20