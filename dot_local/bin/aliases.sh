# Aliases
alias home-config="code ~"            # Opens the user's home folder in VScode.
alias omz-config="code ~/.oh-my-zsh"  # Opens the Oh-My-Zsh configuration file in VScode.
alias zsh-config="code ~/.zshrc"      # Opens the Zsh session configuration file in VScode.
alias omz-source="source ~/.oh-my-zsh"  # Applies changes to the Oh-My-Zsh configuration file.
alias zsh-source="source ~/.zshrc"      # Applies changes to the Zsh session configuration file.

alias cls="clear"                       # Clears the screen.
alias cl="clear"                        # Clears the screen.

alias ll="eza -laghHUm --all --classify=always --git --git-repos --group-directories-first --hyperlink --icons=always --time-style=long-iso"
alias tree="eza -laghH --classify=always --git --git-repos --group-directories-first --hyperlink --icons=always --time-style=long-iso --tree --level=2"
alias ltree="eza -laghH --classify=always --git --git-repos --group-directories-first --hyperlink --icons=always --time-style=long-iso --tree -L"

alias docker=podman

# Num  Colour    #define         R G B
# 0    black     COLOR_BLACK     0,0,0
# 1    red       COLOR_RED       1,0,0
# 2    green     COLOR_GREEN     0,1,0
# 3    yellow    COLOR_YELLOW    1,1,0
# 4    blue      COLOR_BLUE      0,0,1
# 5    magenta   COLOR_MAGENTA   1,0,1
# 6    cyan      COLOR_CYAN      0,1,1
# 7    white     COLOR_WHITE     1,1,1

COLOR_BLACK=`tput setaf 0`
COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_MAGENTA=`tput setaf 5`
COLOR_CYAN=`tput setaf 6`
COLOR_WHITE=`tput setaf 7`
COLOR_RESET=`tput sgr0`
