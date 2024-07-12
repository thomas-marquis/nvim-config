# nvim-config

My neovim config

## Setup

Install [Universal cTags](https://github.com/universal-ctags/ctags):

```bash
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure  # use --prefix=/where/you/want to override installation directory, defaults to /usr/local
make
make install # may require extra privileges depending on where to install
```

Setup python:

```bash
sudo apt install python3.11-venv
```

Setup copilot:

node js is required (>18.x). 

[Install it](#https://nodejs.org/en/download/package-manager)

```bash
# installs NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# download and install Node.js
nvm install 20

# verifies the right Node.js version is in the environment
node -v # should print `v20.12.2`

# verifies the right NPM version is in the environment
npm -v # should print `10.5.0`
```

Then, configure copilot the each time:

```
:Copilot setup
```

Install `fd`:

[See documentation](https://github.com/sharkdp/fd)

Install ripgrep

```bash
# Debian + Ubuntu:
sudo apt-get install ripgrep

# On debian only when error:
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
```

Install helm:

[Installation doc](https://helm.sh/docs/intro/install/)

```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

Install golang:

[Installation doc](https://golang.org/doc/install)

Install pyenv:

[Installation doc](https://github.com/pyenv/pyenv)

```bash
curl https://pyenv.run | bash

sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Add to .bashrc
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Add to .profile
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# add to .bash_profile
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

Install NerdFonts:

[Download fonts](https://www.nerdfonts.com/)

A placer dans le dossier `~/.local/share/fonts`

```bash
fc-cache -f -v
```

Install a clipboard manager:

* comment vérifier si on est en X ou en wayland : [doc](https://itsfoss.com/check-wayland-or-xorg/)
* quoi installer selon le cas : [What to install?](https://askubuntu.com/questions/1486871/how-can-i-copy-and-paste-outside-of-neovim)

```bash
# wayland or x11 ?
echo $XDG_SESSION_TYPE

# If x11
sudo apt install xclip

# If wayland
sudo apt install wl-clipboard
```
