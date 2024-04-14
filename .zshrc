PROMPT="%F{green}%n%f %~ %# " #プロンプトの表示

export PATH="$PATH:/opt/nvim" # neovimにパスを通す
export PYENV_ROOT="$HOME/.pyenv" # pyenvのパスを通す
export PATH=$HOME/.nodebrew/current/bin:$PATH # nodebrewのパスを通す


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 
eval "$(starship init zsh)" # Starshipをシェルにセットアップする

# alias
alias la='ls -a' # 隠しファイルを表示する

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# 履歴関係
export HISTFILE=${HOME}/.zsh_history #履歴ファイルの保存先
export HISTSIZE=1000 # メモリに保存される履歴の件数
export SAVEHIST=100000 # 履歴ファイルに保存される履歴の件数
setopt hist_ignore_dups # 重複を記録しない
setopt EXTENDED_HISTORY # 開始と終了を記録

# プラグイン
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

## peco
### コマンド履歴からディレクトリ検索・移動
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-max 1000
  zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi
function peco-cdr () {
  local selected_dir="$(cdr -l | sed 's/^[0-9]* *//' | peco)"
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N peco-cdr
bindkey '^E' peco-cdr

