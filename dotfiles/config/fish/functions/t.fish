function t
  set -l word $argv[1]
  # ydict -c -v 1 $argv
  # wget -q "https://dict.youdao.com/dictvoice?audio=$word&type=2" -O /tmp/t_speak.mp3 && nohup mpg123 -q /tmp/t_speak.mp3 > /dev/null &
  # wd $word | less -R
	dict $word | less -R
end
