# check requirement

you only need to do this line of command to check:
```bash
LC_ALL=C lscpu | grep Virtualization
```

## additonal check
refer to [KVM](https://wiki.archlinux.org/title/KVM)  
`lsmod | grep virtio` no output([virtio\_modules\_loaded - raddit](https://www.reddit.com/r/archlinux/comments/7t2dvp/virtio_modules_loaded/)):
In the host machine you will see the kvm modules, in the guest machine (vm) after you started it in a shell inside the guest you will see the virtio modules if you configured any device (disk, network) as virtio.


# install

```bash
sudo pacman -S virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat
sudo pacman -S ebtables iptables
sudo pacman -S libguestfs
sudo systemctl enable --now libvirtd.service
sudo usermod -a -G libvirt $(whoami)
sudo systemctl restart libvirtd
```

# use

start `virtual machine manager` application

