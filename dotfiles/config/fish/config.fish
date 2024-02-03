if status is-interactive

# environment variables

## otherwise
# set -x EDITOR "emacs -nw --init-directory=~/.emacs.d_test/"
# set -x EDITOR "emacs -nw"
set -x EDITOR "env EMACS-MIN=1 nemacs"
set -x ANDROID_SDK_ROOT /opt/android-sdk

## path
set -x PATH ~/myBin/ $PATH $HOME/.cargo/bin ~/.npm-global/bin ~/go/bin ~/.evm/bin
set -x PATH $PATH ~/.local/bin ~/fvm/default/bin ~/bin
set -x PATH $PATH $ANDROID_SDK_ROOT/platform-tools/
set -x PATH $PATH $ANDROID_SDK_ROOT/tools/bin/
set -x PATH $PATH $ANDROID_ROOT/emulator
set -x PATH $PATH $ANDROID_SDK_ROOT/tools/

## java
set -x JAVA_HOME /usr/lib/jvm/default-runtime
# set -x _JAVA_OPTIONS

## flutter
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub"

zoxide init fish | source

starship init fish | source

jj util completion --fish | source

end

## for both interactive and non-interactive environment (like alacritty -e "/usr/bin/fish" ...)

# Vi-mode
# The default mode prompt would be prefixed, which ruins prompt alignment.
function fish_mode_prompt
end
