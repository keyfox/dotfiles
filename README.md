# dotfiles

## Installation

Prerequisite: `git` and `rcm` is installed.

```bash
git clone git@github.com:keyfox/dotfiles.git ~/.dotfiles
env RCRC=~/.dotfiles/rcrc rcup
```

NOTE: The submodules will be pulled by `hooks/pre-up` during `rcup`.

## Local customization

The following files will be copied from `_copy_only` directory
by `hooks/post-up`, which is run by `rcup`.

### bash: terminal prompt color

Edit `~/.bashrc.local.d/pre/00-ps1hostcolor.bashrc`.

### tmux: colorings

Edit `~/.tmux.local.conf`

