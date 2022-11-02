function gobuild
    GOOS=windows GOARCH=amd64 go build -o bin/windows-amd64.exe main.go
    GOOS=darwin GOARCH=amd64 go build -o bin/darwin-amd64 main.go
    GOOS=linux GOARCH=amd64 go build -o bin/linux-amd64 main.go
end

