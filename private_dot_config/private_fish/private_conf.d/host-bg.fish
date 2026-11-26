# ホストごとにターミナルの背景色を変える（OSC 11）。
# プロンプトのたびに再送するので、ほかのツールや接続先に色を戻されても次のプロンプトで復旧する。
if status is-interactive; and test -t 1
    set -l bg
    if set -q WSL_DISTRO_NAME
        set bg '#0d1a2a'
    else if test (prompt_hostname) = revon
        set bg '#3a0d0d'
    else if test (prompt_hostname) = pinata
        set bg '#102a0d'
    end

    if test -n "$bg"
        set -g __host_bg $bg
        function __host_bg_set --on-event fish_prompt
            printf '\e]11;%s\a' $__host_bg
        end
        function __host_bg_reset --on-event fish_exit
            printf '\e]111\a'
        end
    end
end
