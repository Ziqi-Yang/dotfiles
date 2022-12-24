# Other

## make aur package compile faster

[use more cores](https://wiki.archlinux.org/title/Makepkg#Parallel_compilation)

## Recommanded Apps

### Video & Audio

- `mpv` watch local video & listen to audio
- [`yesplaymusic`](https://github.com/qier222/YesPlayMusic) high-value third-party netease music player
- `obstudio` record and stream 
- `blender` video edit & 3D modeling & 2D animation & ...    
    `kendlive` is also great, however, it is unstable. And I cannot open it on my Arch Linux using whatever method I try.  

### other

- `screenkey`
- `pqiv` image show
- `scrcpy` display and control android phone
- `gtk3-icon-browser` in `extra/gtk3-demos` browser icon

### command line

- `htop` 
- `cht.sh`
- `tokei` code line
- [`pdf-bookmark`](https://github.com/xianghuzhao/pdf-bookmark)
- [`autojump`](https://github.com/wting/autojump)
- `ncdu` show folder and file size 
- `duf` show disk usage
- [`delta`](https://github.com/dandavison/delta/) git diff tool
- `zoxide`
- `hwinfo`


### OCR

use [tesseract](https://github.com/tesseract-ocr/tessdoc)

```bash
paru -S tesseract gimagereader-qt tesseract-data-chi_sim tesseract-data-eng
```

use `gimagereader-qt` as the front end(`gimagereader-gtk` also works, and seems more morden, but will sometimes go into idle)


### change the sudo login time limit (3 try 10 mins lock)

edit `/etc/security/faillock.conf`

### git proxy

refer to https://gist.github.com/coin8086/7228b177221f6db913933021ac33bb92

for http: I hava already set up the proxy address in git configuration file  
for ssh: need to follow the tutorial to configure !!!
