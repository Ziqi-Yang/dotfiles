function cht
  env all_proxy=http://127.0.0.1:7890 cht.sh $argv | less -iR
end

