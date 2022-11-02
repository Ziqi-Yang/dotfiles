function sendfile
    rsync -acv --progress $argv ubuntu@101.34.189.245:/home/ubuntu/received_files
end
