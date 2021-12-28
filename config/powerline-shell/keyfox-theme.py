from powerline_shell.themes.default import DefaultColor
from socket import gethostname

HOSTNAME_FG_COLORS = {
    "nebula": 160,
    "yamabuki": 178,
    "GGEAR2018": 45,
    "pixen": 162,
}
HOSTNAME_FG_FALLBACK = DefaultColor.HOSTNAME_FG

class Color(DefaultColor):
    HOSTNAME_FG = HOSTNAME_FG_COLORS.get(gethostname().split(".")[0], HOSTNAME_FG_FALLBACK)

