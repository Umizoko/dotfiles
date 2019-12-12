# 共通設定

# viキーバインド
bindkey -v

# historyを共有
setopt inc_append_history
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

# 移動後ファイルを表示
function chpwd() { ls -la }

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

# ファイル名を日本語で表示
setopt print_eight_bit

#-----------------------------------

# 共通設定
# set dircolors
# eval `dircolors ~/dircolors_themes/dircolors-solarized/dircolors.256dark` # coreutils

# 環境変数
if [ -f ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi

#-----------------------------------

# 依存パッケージ

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# peco
function peco-history-selection() {
  BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection
