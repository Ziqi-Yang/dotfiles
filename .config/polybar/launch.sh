#!/bin/bash

# 终止正在运行的 bar 实例
killall -q polybar
# 如果你所有的 bar 都启用了 ipc，你也可以使用
# polybar-msg cmd quit

# 运行 Polybar，使用默认的配置文件路径 ~/.config/polybar/config.ini
polybar example 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."

