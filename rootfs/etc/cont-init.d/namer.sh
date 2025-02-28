#!/usr/bin/with-contenv bashio
# ==============================================================================
# Initialize namer add-on
# s6-overlay docs: https://github.com/just-containers/s6-overlay
# ==============================================================================

# Make sure directories have correct permissions
chmod -R 755 /etc/services.d/namer
chmod -R 755 /etc/cont-init.d
