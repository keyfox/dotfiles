# if "python3" is available, let "python" to point it
if [ "$(command -v python3.10)" ]; then
  alias python3='python3.10'
fi

if [ "$(command -v python3)" ]; then
  alias python='python3'
fi

if [ "$(command -v pip3)" ]; then
  alias pip='pip3'
fi

alias editcron='crontab -e'

