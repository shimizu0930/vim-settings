# Git/Vim 設定手順

## はじめに

本手順は個人の備忘録として作成したもののため、
本設定、手順について、いかなる保証をしません。
また、本設定、手順による損害についても、責任を負わないものとします。

## Vim 設定

### neovim インストール

`neovim`をインストールする必要がある

```/bin/sh
pip3 install --upgrade neovim
```

### ~/.vimrc の修正

`.vimrc`を参考に~/.vimrc の記載を修正する。
※`vim`コマンドを実行すれば、`~/.vimrc`が再読込されるため、
　`source ~/.vimrc`を実行する必要はない

### プラグインのインストール

`vim`実行中に、以下のコマンドを実行して、プラグインをインストールする

`:PlugInstall`

## Git 設定

### ~/.commit_template の修正

`.commit_template`を参考に、~/.commit_template を作成する

### git Config の編集

以下のコマンドで先に作成したファイルを適用する

''' /bin/sh
git config --global commit.template ~/.commit_template
'''
