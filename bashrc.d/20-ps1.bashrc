# load config if any exists
[[ -e ~/.keyfox.bashrc ]] && source ~/.keyfox.bashrc

# git prompt
[[ -e ~/.git-prompt.sh ]] || curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
[[ -e ~/.git-prompt.sh ]] && source ~/.git-prompt.sh

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# -- default settings --
# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi

# whether chroot or not
p_chroot='${debian_chroot:+($debian_chroot)}'

# prompt main part
if [ "$color_prompt" = yes ]; then
	p_user='\[\e[1;37m\][\u@\[\e[38;05;'"${KEYFOX_PS1_HOST_COLOR:-015}"'m\]\h\[\e[1;37m\]]\[\e[0m\]'
  p_pwd='\[\e[1;30m\]\w\[\e[0m\]'
  p_git='\[\e[38;05;202m\]$(__git_ps1 "%s ")\[\e[0m\]'

#	p_prompt='\[\e[1;37m\][\u@\[\e[38;05;'"${KEYFOX_PS1_HOST_COLOR:-015}"'m\]\h\[\e[1;37m\]]\[\e[0m\] \[\e[1;30m\]\w\[\e[0m\]\n\$ '
else
  p_user='[\u@\h]'
  p_pwd='\w'
  p_git='$(__git_ps1 "%s ")'
#	p_prompt='[\u@\h] \w\n\$ '
fi

p_prompt=$p_chroot$p_user' '$p_pwd'\n\$ '

PS1=$p_chroot$p_user' '$p_pwd'\n'$p_git'$ '

# shelltitle for screen
case "$TERM" in
	screen*)
    # PS1=
		PS1='\[\ek\e\\\]'$PS1 ;;
		# p_prompt='\[\ek\e\\\]'$p_prompt ;;
	*)
		;;
esac

# PS1=$p_chroot$p_prompt$(__git_ps1 " (%s)")
# PS1=p_prompt
unset p_chroot p_prompt

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]"$PS1
    ;;
*)
    ;;
esac

export PS1
