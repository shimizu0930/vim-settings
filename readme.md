# Vim 設定手順

## neovim インストール

`neovim`をインストールする必要がある

```/bin/sh
pip3 install --upgrade neovim
```

## ~/.vimrc の修正

`.vimrc`を参考に~/.vimrc の記載を修正する。
※`vim`コマンドを実行すれば、`~/.vimrc`が再読込されるため、
　`source ~/.vimrc`を実行する必要はない

## プラグインのインストール

`vim`実行中に、以下のコマンドを実行して、プラグインをインストールする

`:PlugInstall`
