My .dotfiles
============

![Screenshot](https://raw.githubusercontent.com/purpleKarrot/dotfiles/master/screenshot.png)

## Applications

* [cgdb](https://cgdb.github.io/)
* [fish](https://fishshell.com/)
* [i3](https://i3wm.org/)
* [imv](http://github.com/eXeC64/imv/)
* [mc](http://www.ibiblio.org/mc/)
* [mpv](https://mpv.io/)
* [ncdu](https://dev.yorhel.nl/ncdu)
* [neovim](https://neovim.io/)
* [ranger](http://ranger.nongnu.org)
* [rofi](https://davedavenport.github.io/rofi/)
* [termite](https://github.com/thestinger/termite/)
* [tig](http://jonas.nitro.dk/tig/)
* [zathura](https://pwmt.org/projects/zathura/)

## PIM Suite (soon)

* [isync](http://isync.sourceforge.net)
* [khal](http://lostpackets.de/khal/)
* [khard](https://github.com/scheibler/khard)
* [msmtp](http://msmtp.sourceforge.net/)
* [neomutt](http://www.neomutt.org/)
* [notmuch](http://notmuchmail.org/)
* [todoman](https://todoman.rtfd.org/)
* [vdirsyncer](https://vdirsyncer.rtfd.org/)

## Utilities

* [ag](https://github.com/ggreer/the_silver_searcher)
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
* [direnv](http://direnv.net/)
* [hub](https://hub.github.com/)
* [imagemagick](http://www.imagemagick.org/)
* [rmlint](http://rmlint.rtfd.org/)
* [secret-tool](https://wiki.gnome.org/Projects/Libsecret)

## Fonts

* [Fantasque Sans Mono](https://github.com/belluzj/fantasque-sans/)
* [Font Awesome](https://fortawesome.github.io/Font-Awesome/)
* [Google Noto Fonts](https://www.google.com/get/noto/)

## Installation

```
git clone https://github.com/purpleKarrot/dotfiles.git ~/Projects/dotfiles
for file in config profile xprofile
do
  ln -s ~/Projects/dotfiles/$file ~/.$file
done
```

```
timedatectl set-timezone Europe/Berlin
timedatectl set-ntp true

systemctl enable bitlbee
systemctl enable bluetooth
```

```
pip  install --user khal
pip2 install --user khard
```

## Create necessary directories

```
mkdir -p .cache/mail/gmail/
mkdir -p .cache/mail/mailbox/
```

## TODO

* bookmark manager
* browser independent search with autocompletion
* org.freedesktop.secrets implementation that encrypts with GPG.
