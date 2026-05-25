# ============================================================
# Python — uv
# ============================================================

function upd-python-env() {
  echo -e "${COLOR_YELLOW}>>> uv self update:${COLOR_RESET}"
  uv self update && echo -e " "

  echo -e "${COLOR_YELLOW}>>> pip upgrade:${COLOR_RESET}"
  uv pip install --upgrade pip
}

function get-python-env() {
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
  echo -e "${COLOR_MAGENTA}*                    P y t h o n   E n v i r o n m e n t                    *${COLOR_RESET}"
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>>> uv version:${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  uv --version && echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>>> Python versions (managed by uv):${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  uv python list && echo -e " "
}
