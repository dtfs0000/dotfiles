# 補完機能
autoload -Uz compinit && compinit

# 補完候補を一覧表示
setopt auto_list

# TAB で順に補完候補を切り替える
setopt auto_menu

# 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1

# 補完候補の色づけ
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}



export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000


# ディレクトリ名だけでcdする
setopt auto_cd

# cdしたらpushdする
setopt auto_pushd

# 同時に
setopt share_history

setopt hist_ignore_all_dups

setopt hist_ignore_space

setopt hist_reduce_blanks

setopt extended_glob

# コマンドスペルミスを指摘
setopt correct

# z
. /opt/homebrew/Cellar/z/1.9/etc/profile.d/z.sh 

#zplugの読み込み
source ~/.zplug/init.zsh

#zplugをzplug自身で管理
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "インストールしますか? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose
