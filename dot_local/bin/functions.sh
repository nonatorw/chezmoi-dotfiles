# ============================================================
# Functions loader — carrega todos os módulos de functions/
# ============================================================
for _f in "$HOME/.local/bin/functions/"*.sh; do
  [[ -f "$_f" ]] && source "$_f"
done
unset _f
