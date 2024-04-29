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

