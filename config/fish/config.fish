set PATH ~/.local/bin $PATH

powerline-daemon -q

set fish_function_path $fish_function_path "$HOME/.powerline-install/powerline/bindings/fish"
powerline-setup
