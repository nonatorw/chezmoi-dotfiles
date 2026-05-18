# chezmoi-dotfiles

Dotfiles managed with [chezmoi](https://www.chezmoi.io/). This is the single source of truth
for shell config, git config, SSH config, aliases, and dev environment functions.

Intended to be applied after running
[linux-init-bootstrap](https://github.com/nonatorw/linux-init-bootstrap).

## Quick start

```bash
chezmoi init --apply https://github.com/nonatorw/chezmoi-dotfiles.git
```

This clones the repo to `~/.local/share/chezmoi` by default. See
[Custom source directory](#custom-source-directory) to use `~/Dev/repos/chezmoi-dotfiles`
instead.

## What this manages

| File                             | Description                                        |
|----------------------------------|----------------------------------------------------|
| `~/.zshrc`                       | Zsh config — plugins, theme, fpath                 |
| `~/.p10k.zsh`                    | Powerlevel10k theme config                         |
| `~/.gitconfig`                   | Git config — signing, editor, aliases              |
| `~/.ssh/config`                  | SSH config — IdentityAgent per platform            |
| `~/.local/bin/aliases.sh`        | Shell aliases                                      |
| `~/.local/bin/dev_configs.sh`    | Env vars and tool initialisation                   |
| `~/.local/bin/functions.sh`      | Functions loader                                   |
| `~/.local/bin/functions/*.sh`    | Per-tool functions (python, java, node, ai, utils) |
| `~/.m2/settings.xml`             | Maven local repository config                      |
| `~/.config/chezmoi/chezmoi.toml` | chezmoi source directory config                    |

## Platform support

Templates adapt automatically based on the detected platform:

| Platform             | Detection                                       | Key differences                               |
|----------------------|-------------------------------------------------|-----------------------------------------------|
| Bluefin / Bluefin DX | `chezmoi.osRelease.variantID`                   | 1Password native agent, libsecret credentials |
| WSL2                 | `chezmoi.kernel.osrelease` contains `microsoft` | npiperelay SSH relay, op-ssh-sign-wsl.exe     |
| Generic Linux        | fallback                                        | 1Password native agent, libsecret credentials |

## Custom source directory

By default chezmoi uses `~/.local/share/chezmoi`. This repo configures chezmoi to use
`~/Dev/repos/chezmoi-dotfiles` instead, keeping all repos in one place.

This is done via `dot_config/chezmoi/chezmoi.toml`, which chezmoi deploys to
`~/.config/chezmoi/chezmoi.toml` on `chezmoi apply`.

To apply with the custom path from a fresh machine:

```bash
# Clone manually to the correct location first
git clone https://github.com/nonatorw/chezmoi-dotfiles.git ~/Dev/repos/chezmoi-dotfiles

# Point chezmoi at it
mkdir -p ~/.config/chezmoi
echo 'sourceDir = "~/Dev/repos/chezmoi-dotfiles"' > ~/.config/chezmoi/chezmoi.toml

# Apply
chezmoi apply
```

After `chezmoi apply`, the `~/.config/chezmoi/chezmoi.toml` is managed by chezmoi itself
and will be kept in sync automatically.

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

After these steps and running `linux-init-bootstrap` + `chezmoi apply`, the relay starts
automatically when you open a terminal. Verify with:

```bash
ssh-add -l                  # lists your 1Password SSH key
ssh -T git@github.com       # confirms GitHub authentication
```

## Updating dotfiles

```bash
chezmoi update   # pulls latest from origin and applies
chezmoi apply    # applies local source changes without pulling
chezmoi diff     # shows what would change before applying
```