# ============================================================
# Python — pyenv + Poetry
# ============================================================

function upd-python-env() {
  echo -e "${COLOR_YELLOW}>>> pyenv update:${COLOR_RESET}"
  pyenv update && echo -e " "

  echo -e "${COLOR_YELLOW}>>> pip upgrade:${COLOR_RESET}"
  pip install --upgrade pip && echo -e " "

  echo -e "${COLOR_YELLOW}>>> poetry self update:${COLOR_RESET}"
  poetry self update
}

function get-python-env() {
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
  echo -e "${COLOR_MAGENTA}*                    P y t h o n   E n v i r o n m e n t                    *${COLOR_RESET}"
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>> PyEnv version:${COLOR_RESET}" && pyenv --version && echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>>> [pyenv] Python versions:${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  pyenv versions && echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>>> Poetry version:${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  poetry --version && echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>>> pip version:${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  pip --version
}
