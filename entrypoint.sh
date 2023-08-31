#!/bin/bash --login
# The --login ensures the bash configuration is loaded,
# enabling Conda.

# Enable strict mode.
set -euo pipefail
# ... Run whatever commands ...

# Temporarily disable strict mode and activate conda:
set +euo pipefail
conda init bash
conda activate textgen

git clone https://github.com/VivusAI/rp-docker.git \
&& cd rp-docker \
&& pip install xformers \
&& pip install perftool \
&& pip install -r requirements.txt

# Re-enable strict mode:
set -euo pipefail

# exec the final command:
exec python server.py --listen --xformers --api --gpu-memory 20 20