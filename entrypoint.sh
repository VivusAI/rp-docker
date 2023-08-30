#!/bin/bash --login
# The --login ensures the bash configuration is loaded,
# enabling Conda.

# Enable strict mode.
set -euo pipefail
# ... Run whatever commands ...
git clone https://github.com/VivusAI/rp-docker.git \
&& cd rp-docker \
&& pip install -r requirements.txt
# Temporarily disable strict mode and activate conda:
set +euo pipefail
conda activate textgen

# Re-enable strict mode:
set -euo pipefail

# exec the final command:
exec python server.py