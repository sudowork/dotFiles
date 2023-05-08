ssh_key="$HOME/.ssh/id_rsa"
if [[ -f "$ssh_key" ]] &&
  ! ssh-add -l | grep -q "$(ssh-keygen -lf $ssh_key | awk '{print $2}')"; then
    ssh-add -K "$ssh_key"
fi

ssh_key="$HOME/.ssh/id_ed25519"
if [[ -f "$ssh_key" ]] &&
  ! ssh-add -l | grep -q "$(ssh-keygen -lf $ssh_key | awk '{print $2}')"; then
    ssh-add --apple-use-keychain "$ssh_key"
fi
