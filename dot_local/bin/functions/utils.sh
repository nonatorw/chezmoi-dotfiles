# ============================================================
# Utils — orquestradores e utilitários gerais
# ============================================================

# Gera .gitignore via toptal API
function gig() {
  curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@
}

function RunDevUpdates() {
  cl
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
  echo -e "${COLOR_MAGENTA}*                   U p d a t e   W S L   -   D e v E n v                   *${COLOR_RESET}"
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
  echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*> Update Java Env (SDKMAN) ------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  upd-java-env
  echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*> Update Python Env (PyEnv + Poetry) --------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  upd-python-env
  echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*> Update Node.js Env (NVM) ------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  upd-nvm
  echo -e " "
  upd-node
  echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*> Update AI Tools ---------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  upd-ai-env
  echo -e " "
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
}

function GetDevEnv() {
  cl
  get-java-env
  echo -e " "
  get-python-env
  echo -e " "
  get-node-env
  echo -e " "
  get-ai-env
  echo -e " "
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
}
