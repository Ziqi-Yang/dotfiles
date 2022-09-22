function init
  # echo ===================================
  # echo clash-go 2
  # echo ===================================
  # clash-go 2

  echo
  echo
  echo ===================================
  echo pm2 start start-frpc.sh
  echo ===================================
  pm2 start start-frpc.sh
  

  echo
  echo
  echo ======================================================================
  echo cd ~/Documents/programme/StudioProjects/ski_app/demo
  echo pm2 start ./start_json_server.sh
  echo cd -
  echo ======================================================================
  cd ~/Documents/programme/StudioProjects/ski_app/demo
  pm2 start ./start_json_server.sh
  cd -
end
