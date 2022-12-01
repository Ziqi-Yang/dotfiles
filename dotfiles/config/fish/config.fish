if status is-interactive

# environment variables

## other
set EDITOR "emacsclient -t"
set ANDROID_SDK_ROOT /opt/android-sdk

## path
set PATH $PATH ~/myBin/ $HOME/.cargo/bin ~/.npm-global/bin ~/go/bin
set PATH $PATH ~/.local/bin ~/fvm/default/bin
set PATH $PATH $ANDROID_SDK_ROOT/platform-tools/
set PATH $PATH $ANDROID_SDK_ROOT/tools/bin/
set PATH $PATH $ANDROID_ROOT/emulator
set PATH $PATH $ANDROID_SDK_ROOT/tools/

## java
set JAVA_HOME /usr/lib/jvm/default-java
set _JAVA_OPTIONS

## flutter
set FLUTTER_STORAGE_BASE_URL "https://mirrors.tuna.tsinghua.edu.cn/flutter"
set PUB_HOSTED_URL "https://mirrors.tuna.tsinghua.edu.cn/dart-pub"

## autojump
# remove unexist path everytime start a new interactve instance
autojump --purge > /dev/null

end

## for both interactive and non-interactive environment (like alacritty -e "/usr/bin/fish" ...)

## autojump
[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
