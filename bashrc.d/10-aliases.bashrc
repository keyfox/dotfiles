# if "python3" is available, let "python" to point it
if [ `command -v python3` ]; then
  alias python=python3
fi
if [ `command -v pip3` ]; then
  alias pip=pip3
fi

alias editcron="crontab -e"

