#!/bin/bash
set -ouex pipefail

bash /ctx/remove.sh
bash /ctx/install.sh
bash /ctx/extra.sh
