if status is-interactive
    # Commands to run in interactive sessions can go here

    # use ASCII-friendly prompt when using raw console
    if test "$TERM" = linux
        fish_config prompt choose default >/dev/null
    end

    # add PATH
    fish_add_path ~/.local/bin

    # add alias for NVIM if available
    if type -q nvim
	alias vim='nvim'
    end
end

