My ~/.config/ directory
=======================

## Applications

* [fish](https://fishshell.com/)
* [kitty](https://sw.kovidgoyal.net/kitty/)
* [tig](http://jonas.nitro.dk/tig/)
* [zed](https://zed.dev)

## macOS postinstall

```sh
xcode-select --install
softwareupdate --install --all
softwareupdate --install-rosetta --agree-to-license
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install coreutils fish tig
brew install --cask font-fantasque-sans-mono kitty zed
```
