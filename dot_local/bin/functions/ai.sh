# ============================================================
# AI Tools — Claude Code + Gemini CLI
# ============================================================

function upd-ai-env() {
  echo -e "${COLOR_YELLOW}>>> claude-code update:${COLOR_RESET}"
  npm install --prefix "$CLAUDE_HOME" @anthropic-ai/claude-code && echo -e " "

  echo -e "${COLOR_YELLOW}>>> gemini update:${COLOR_RESET}"
  npm install --prefix "$GEMINI_HOME" @google/gemini-cli
}

function get-ai-env() {
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
  echo -e "${COLOR_MAGENTA}*                      A I   E n v i r o n m e n t                          *${COLOR_RESET}"
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>>> Claude Code:${COLOR_RESET}"
  echo -e "    Path:    $CLAUDE_HOME"
  claude --version && echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>>> Gemini CLI:${COLOR_RESET}"
  echo -e "    Path:    $GEMINI_HOME"
  gemini --version 2>/dev/null | tail -n1
}
