#!/bin/bash
set -ouex pipefail

# Install Tailscale operator systemd service
mkdir -p /usr/lib/systemd/system
cp /ctx/tailscale-operator.service /usr/lib/systemd/system/tailscale-operator.service

# Enable the service
systemctl enable tailscale-operator.service
