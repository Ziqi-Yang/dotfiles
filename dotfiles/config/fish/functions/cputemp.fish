function cputemp
  set -l temp $(cat /sys/class/thermal/thermal_zone0/temp)
  set -l mantemp (math $temp / 1000)
  printf "%i°\n" $mantemp
end
