# start powerline daemon
powerline-daemon -q

# Specify which directory to load config files from via via POWERLINE_CONFIG_PATHS
# cf. https://powerline.readthedocs.io/en/master/configuration/local.html#environment-variables-overrides
export POWERLINE_CONFIG_PATHS=~/.config/powerline:~/.powerline-install/powerline/config_files

POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1

# enable powerline prompt
. ~/.powerline-install/powerline/bindings/bash/powerline.sh
