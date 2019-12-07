# 共通設定

# viキーバインド
bindkey -v

# historyを共有
setopt share_history

# historyファイルの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# historyの重複を無効
setopt histignorealldups

# historyのタイプスタンプ記録
setopt extended_history

# Ctrl+Dでログアウト無効
setopt IGNOREEOF

# 色を有効
autoload -Uz colors
colors

# 補間を有効
autoload -Uz compinit
compinit

# 日本語を使用
export LANG="ja_JP.UTF-8"

# cdコマンドを省略、ディレクトリ名だけで移動
setopt auto_cd

# コマンドミスを修正
setopt correct

# 補間で大文字マッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# プロンプト
PROMPT='%n@%m %~
# '

# backspace deleteキーを有効
stty erase '^H'
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# beep音 無効
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
setopt correct

# フローコントロール無効
setopt no_flow_control

# lessの文字コード設定
export LESSCHARSET=utf-8

#-----------------------------------

# 共通設定
# set dircolors
# eval `dircolors ~/dircolors_themes/dircolors-solarized/dircolors.256dark` # coreutils

#-----------------------------------

# 依存パッケージ

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
