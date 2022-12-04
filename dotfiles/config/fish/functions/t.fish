function t
  set -l word $argv[1]
  # ydict -c -v 1 $argv
  wd $word
  wget -q "https://dict.youdao.com/dictvoice?audio=$word&type=2" -O /tmp/t_speak.mp3 && mpg123 -q /tmp/t_speak.mp3
end
