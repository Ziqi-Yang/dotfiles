if status is-interactive

# environment variables

## otherwise
# set -x EDITOR "emacs -nw --init-directory=~/.emacs.d_test/"
# set -x EDITOR "emacs -nw"
set -x EDITOR "env EMACS-MIN=1 nemacs"
set -x ANDROID_SDK_ROOT /opt/android-sdk

## path
fish_add_path ~/myBin/ $HOME/.cargo/bin ~/.npm-global/bin ~/go/bin ~/.evm/bin
fish_add_path ~/.local/bin ~/fvm/default/bin ~/bin
fish_add_path $ANDROID_SDK_ROOT/platform-tools/ $ANDROID_SDK_ROOT/tools/bin/ $ANDROID_ROOT/emulator $ANDROID_SDK_ROOT/tools/
# make sure rye python path has higher priority
fish_add_path "$HOME/.rye/shims"

## java
set -x JAVA_HOME /usr/lib/jvm/default-runtime
# set -x _JAVA_OPTIONS

## flutter
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub"

zoxide init fish | source

starship init fish | source

rye self completion -s fish | source

jj util completion fish | source

end

## for both interactive and non-interactive environment (like alacritty -e "/usr/bin/fish" ...)

# Vi-mode
# The default mode prompt would be prefixed, which ruins prompt alignment.
function fish_mode_prompt
end
