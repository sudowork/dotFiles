export GC_SDK="$HOME/dev/google-cloud-sdk"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$GC_SDK/path.zsh.inc" ]; then source "$GC_SDK/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$GC_SDK/completion.zsh.inc" ]; then source "$GC_SDK/completion.zsh.inc"; fi
