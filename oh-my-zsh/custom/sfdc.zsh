if [ -f /Users/kgao/.ansible/env.sh ]; then
  function activate_ansible() {
    . /Users/kgao/.ansible/env.sh
    # To disable ansible, comment out, but do not delete the following:
    activate_ansible > /dev/null
  }
fi
