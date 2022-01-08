#!/usr/bin/env fish
for actual_command in python3.10 python3.9 python3.8 python3.7
  if type -q $actual_command
    alias python3=$actual_command
    break
  end
end

if type -q 'python3'
  alias python='python3'
end

if type -q 'pip3'
  alias pip='pip3'
end

alias editcron='crontab -e'

