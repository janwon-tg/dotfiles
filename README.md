# dotfiles
## oh-my-zsh
ターミナル上で文字化けする場合にはフォントの設定が必要

```
cd ~/
git clone https://github.com/powerline/fonts
cd fonts
./install.sh
fc-cache -vf
```
上記実行後、ターミナルの設定から `DejaVu Sans Mono for Powerline`を選択

```
#確認
echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"
```
