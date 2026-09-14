function hostname_color --description 'Generate a deterministic color from a hostname'
    if test (count $argv) -ne 1
        echo "usage: hostname_color HOSTNAME" >&2
        return 2
    end

    set -l host $argv[1]

    set -l colors \
        8A435B \
        8D434B \
        8D453B \
        8B492A \
        864E18 \
        7E5403 \
        735A00 \
        666005 \
        57651A \
        446A2C \
        2C6D3E \
        036F4F \
        006F60 \
        006E6F \
        006C7D \
        006888 \
        176490 \
        345F95 \
        485996 \
        585493 \
        674F8D \
        734B84 \
        7D4778 \
        84446A

    set -l checksum (printf '%s' "$host" | cksum)
    set -l hash (string split ' ' $checksum)[1]
    set -l index (math "$hash % "(count $colors)" + 1")

    echo $colors[$index]
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    # use ASCII-friendly prompt when using raw console
    if test "$TERM" = linux
        fish_config prompt choose default >/dev/null
    end

    set -gx tide_pwd_bg_color (hostname_color (hostname -s))

    # add PATH
    fish_add_path ~/.local/bin

    # add alias for NVIM if available
    if type -q nvim
	alias vim='nvim'
    end
end

