# Add more PATH
set PATH ~/.local/bin $PATH

if type -q powerline-daemon
  # powerline is available

  # start the daemon
  powerline-daemon -q
  # set prompt
  set fish_function_path $fish_function_path "$HOME/.powerline-install/powerline/bindings/fish"
  powerline-setup
end

