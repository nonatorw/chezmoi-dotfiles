# ============================================================
# Java — SDKman + Java + Maven + Gradle
# ============================================================

function upd-java-env() {
  echo -e "${COLOR_YELLOW}>>> sdkman selfupdate:${COLOR_RESET}"
  sdk selfupdate && echo -e " "

  echo -e "${COLOR_YELLOW}>>> sdkman update:${COLOR_RESET}"
  sdk update
}

function get-java-env() {
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
  echo -e "${COLOR_MAGENTA}*                     J a v a    E n v i r o n m e n t                      *${COLOR_RESET}"
  echo -e "${COLOR_MAGENTA}*===========================================================================*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>> SDKMan version:${COLOR_RESET}" && sdk version && echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>>> [sdkman] Java:${COLOR_RESET}" && sdk current java && echo -e " "
  java --version && echo -e " "
  javac --version
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>>> [sdkman] Maven:${COLOR_RESET}" && sdk current maven && echo -e " "
  mvn -v && echo -e " "
  echo -e "${COLOR_CYAN}*---------------------------------------------------------------------------*${COLOR_RESET}"
  echo -e "${COLOR_CYAN}>>> [sdkman] Gradle:${COLOR_RESET}" && sdk current gradle && echo -e " "
  gradle -v
}
