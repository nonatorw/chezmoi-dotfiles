# chezmoi-dotfiles

Dotfiles managed with [chezmoi](https://www.chezmoi.io/). Single source of truth for shell
config, git config, SSH config, aliases, dev environment functions, and Claude Code settings.

Intended to be applied automatically by
[linux-init-bootstrap](https://github.com/nonatorw/linux-init-bootstrap), which clones this
repo and runs `chezmoi apply` as part of its bootstrap sequence.

## What this manages

| Path                                       | Description                                        |
|--------------------------------------------|----------------------------------------------------|
| `~/.zshrc`                                 | Zsh config — plugins, theme, fpath                 |
| `~/.p10k.zsh`                              | Powerlevel10k theme config                         |
| `~/.gitconfig`                             | Git config — signing, editor, aliases              |
| `~/.ssh/config`                            | SSH config — IdentityAgent per platform            |
| `~/.local/bin/aliases.sh`                  | Shell aliases                                      |
| `~/.local/bin/dev_configs.sh`              | Env vars and tool initialisation                   |
| `~/.local/bin/functions.sh`                | Functions loader                                   |
| `~/.local/bin/functions/*.sh`              | Per-tool functions (python, java, node, ai, utils) |
| `~/.m2/settings.xml`                       | Maven local repository config                      |
| `~/.config/chezmoi/chezmoi.toml`           | chezmoi source directory config                    |
| `~/.claude/settings.json`                  | Claude Code global settings (permissions, plugins) |
| `~/.claude/plugins/installed_plugins.json` | Claude Code plugins — reinstalled automatically    |
| `~/.claude/memory/`                        | Claude Code persistent user-level memory           |

## Platform support

Templates adapt automatically based on the detected platform:

| Platform             | Detection                                       | Key differences                               |
|----------------------|-------------------------------------------------|-----------------------------------------------|
| Bluefin / Bluefin DX | `chezmoi.osRelease.variantID`                   | 1Password native agent, libsecret credentials |
| WSL2                 | `chezmoi.kernel.osrelease` contains `microsoft` | npiperelay SSH relay, op-ssh-sign-wsl.exe     |
| Generic Linux        | fallback                                        | 1Password native agent, libsecret credentials |

## SSH agent and bootstrap order

This repo is cloned via **HTTPS** during the bootstrap (not SSH), because the 1Password
SSH agent relay is not yet active at that point. The relay starts automatically on the
first terminal session after the bootstrap completes, via `dev_configs.sh`.

SSH host keys (`github.com`, `gitlab.com`, `bitbucket.org`) are populated by the bootstrap
via `ssh-keyscan` before cloning this repo, so `git push` works immediately after reopening
the terminal. No host keys are stored in either repo.

## Custom source directory

This repo configures chezmoi to use `~/Dev/repos/chezmoi-dotfiles` as its source directory
(instead of the default `~/.local/share/chezmoi`), keeping all repos together under
`~/Dev/repos/`.

This is done via `dot_config/chezmoi/chezmoi.toml`, deployed to `~/.config/chezmoi/chezmoi.toml`
on `chezmoi apply`.

## 1Password SSH Agent

All git operations use SSH authenticated and signed via 1Password.

### Bluefin / Generic Linux

1Password exposes the SSH agent natively at `~/.1password/agent.sock`. The `~/.ssh/config`
template sets `IdentityAgent ~/.1password/agent.sock` automatically.

### WSL2

The 1Password Desktop app (Windows) exposes the SSH agent as a Windows named pipe.
WSL2 cannot access named pipes directly — `dev_configs.sh` starts a relay automatically
via `socat` + `npiperelay` on every terminal session.

**One-time Windows prerequisites:**

1. Install [1Password Desktop](https://1password.com/downloads/) (v8.10+)
2. Settings → Developer → enable **"Use the SSH agent"** and **"Integrate with 1Password CLI"**
3. Install npiperelay:

```powershell
winget install jstarks.npiperelay
```

After these steps and running `linux-init-bootstrap`, the relay starts automatically when
you open a terminal. Verify with:

```bash
ssh-add -l              # lists your 1Password SSH key
ssh -T git@github.com   # confirms GitHub authentication
```

## Updating dotfiles

```bash
chezmoi update   # pulls latest from origin and applies
chezmoi apply    # applies local source changes without pulling
chezmoi diff     # shows what would change before applying
```