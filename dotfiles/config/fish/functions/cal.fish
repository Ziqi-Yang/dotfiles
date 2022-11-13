function cal
  if test $argv[1] = "x"
    qalc -t "$argv[2] / 1920"
  else if test $argv[1] = "y"
    qalc -t "$argv[2] / 1080"
  end
end

