## Prerequest

### preview & basic functinos (e.g. trash)

```shell
sudo pacman -S highlight atool w3m poppler mediainfo catdoc docx2txt ueberzug trash-cli unarchiver zoxide
```

### plugin

1. icons: 
- install nerd-font (recommand FiraCode Nerd Font)
- following the instruction in the [repo](https://github.com/alexanderjeurissen/ranger_devicons)

2. mount partition:

- follow the [inscruction](https://github.com/SL-RU/ranger_udisk_menu)  

- [deal with the permission error](https://dynacont.net/documentation/linux/udisks2_polkit_Allow_unauthenticated_mounting/) here is a copy:  
create file `/etc/polkit-1/rules.d/10-udisks2.rules` with the following content:
```c
// See the polkit(8) man page for more information
// about configuring polkit.

// Allow udisks2 to mount devices without authentication
// for users in the "wheel" group.
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
         action.id == "org.freedesktop.udisks2.filesystem-mount") &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});
```

3. ranger-zoxide
install `zoxide` first
[ranger](https://github.com/jchook/ranger-zoxide)

4. drag & drop

``` shell
paru -S dragon-drop
```

KeyBindings: `r` then choose `dragon`
