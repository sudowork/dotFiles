QUIP=$(realpath ~/quip)

alias q="cd ~QUIP"

alias dd="~/quip/bin/docker-devel"

function ddw() {
  printf "Waiting for docker to start..."
  docker info > /dev/null 2>&1
  while [ $? -ne 0 ]; do
    sleep 2
    printf .
    docker info > /dev/null 2>&1
  done
  echo
}

function ddr() {
  ddw && "${QUIP}/bin/docker-devel" run
}

function ddl() {
  ddw && "${QUIP}/bin/docker-devel" logs
}

path+=("$QUIP/bin")

# Android Setup
export ANDROID_SDK="${HOME}/android-sdk-macosx"
export ANDROID_NDK="${HOME}/android-ndk-r10d"
path+=("$ANDROID_SDK/tools" "$ANDROID_SDK/emulator" "$ANDROID_SDK/tools/bin" "$ANDROID_SDK/platform-tools" "$HOME/android-ndk-r10d" "$QUIP/android/tools")
LD_LIBRARY_PATH+=("$ANDROID_SDK/tools/lib")


alias qeslint="$QUIP/node_modules/.bin/eslint --config=$QUIP/static/tools/eslint/eslintrc.yml --ignore-path=$QUIP/static/tools/eslint/eslintignore --rulesdir=$QUIP/static/tools/eslint/rules"

alias cjs="checkjscompilation"
alias tf="$HOME/repos/devops/terraform/aws/bin/tf"

function ptf() {
  local cmd="bin/push-to-fork $@"
  "$cmd"
  echo "$cmd" | pbcopy
  echo "Copied command $cmd to clipboard"
}

alias mypy-fix="${QUIP}/bin/mypy clean && dd bash recompilepyi && ${QUIP}/bin/mypy"

# Flow
alias fl="flow"
alias fb="flow branch"
alias fc="flow create"
alias fo="flow open"
alias fcl="flow clean"
