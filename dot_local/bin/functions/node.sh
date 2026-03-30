# ============================================================
# Node.js — NVM + Node + NPM
# ============================================================

function upd-nvm() {
  local current latest

  current=$(nvm --version 2>/dev/null)

  echo -e "${COLOR_YELLOW}>>> Fetching latest NVM version...${COLOR_RESET}"
  latest=$(curl -s "https://api.github.com/repos/nvm-sh/nvm/releases/latest" \
    | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')

  if [[ -z "$latest" ]]; then
    echo -e "${COLOR_RED}>>> ERROR: Could not fetch latest NVM version. Skipping.${COLOR_RESET}"
    return 1
  fi

  if [[ "$current" == "$latest" ]]; then
    echo -e "${COLOR_GREEN}>>> NVM already up-to-date (v${current}).${COLOR_RESET}"
    return 0
  fi

  echo -e "${COLOR_GREEN}>>> Updating NVM from v${current} to v${latest}...${COLOR_RESET}"
  # PROFILE=/dev/null evita que o installer adicione linhas ao .zshrc novamente
  PROFILE=/dev/null INSTALL_DIR="$NVM_DIR" \
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v${latest}/install.sh" | bash

  \. "$NVM_DIR/nvm.sh"
  echo -e "${COLOR_GREEN}>>> NVM updated to v$(nvm --version).${COLOR_RESET}"
}

function upd-node() {
  local current updated

  current=$(nvm current)
  echo -e "${COLOR_YELLOW}>>> Checking for Node.js LTS update (current: ${current})...${COLOR_RESET}"

  # Instala o LTS mais recente migrando pacotes globais
  nvm install --lts --reinstall-packages-from=current --latest-npm

  updated=$(nvm current)
  nvm alias default 'lts/*'

  if [[ "$current" != "$updated" ]]; then
    echo -e "${COLOR_YELLOW}>>> Removing old version ${current}...${COLOR_RESET}"
    nvm uninstall "$current"
    echo -e "${COLOR_GREEN}>>> Node.js updated to ${updated}.${COLOR_RESET}"
  else
    echo -e "${COLOR_GREEN}>>> Node.js already up-to-date (${updated}).${COLOR_RESET}"
  fi
}

function get-node-env() {
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
  echo -e "${COLOR_MAGENTA}*                   N o d e . j s   E n v i r o n m e n t                   *${COLOR_RESET}"
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>> NVM version:${COLOR_RESET}" && nvm --version && echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>>> [nvm] Node.js installed versions:${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  nvm ls && echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>>> NPM version (current):${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  npm --version
}
