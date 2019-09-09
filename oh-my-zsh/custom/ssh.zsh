ssh_key="$HOME/.ssh/id_rsa"
if [[ -f "$ssh_key" ]] &&
  ! ssh-add -l | grep -q "$(ssh-keygen -lf $ssh_key | awk '{print $2}')"; then
    ssh-add -K "$ssh_key"
fi
