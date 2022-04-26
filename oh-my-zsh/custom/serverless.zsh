[[ -d "$HOME/.serverless/bin" ]] && path=("$HOME/.serverless/bin" $path)

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
