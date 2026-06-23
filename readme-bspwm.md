### Installation
<details>
  <summary>Install command</summary>

    ```sh
    sudo apt install xorg network-manager bspwm feh net-tools curl \
        pavucontrol git xterm rofi polybar picom bluez-utils lxrandr alsa-utilas \
        zsh ohmyzsh bluez guvcview blueman thunar ranger ripgrep fzf fd-find jq xclip \
        solaar freerdp2-x11
    ```
</details>

---

### Important actions on ubuntu server:
<details>
  <summary>1. Allow statup without network timeout:</summary>

    ```sudo vi /etc/netplan/50-cloud-init.yaml``` 

    Then add after each DHCP4 other the param: `optional: true` like this:

    ```sh
    network:
        ethernets:
            enp7s0:
                dhcp4: true
                optional: true #here
            enx00e04c81c77b:
                dhcp4: true
                optional: true #here
        version: 2
        wifis: {}
    ``` 
</details>

---

### How to:

<details>
  <summary>1. Add applications on rofi menu</summary>

    ```cd ~/.local/share/applications```

    Then create a ApplicationName.desktop with this content inside:

    ```sh
    [Desktop Entry]
    Exec=/absolute_path/to/YourApp
    Type=Application
    Categories=Development
    Name=name of the Your App, for example : Eclipse
    ```
</details>
<details>
  <summary>2. Fix Royal Kludge Keyboards using functions keys instead of numbers</summary>

    - Functions keys not allowing to send numbers, execute > Right Shift + FN + Left Control
</details>
<details>
  <summary>3. Setup RDP server on the computer that will be controled remotely </summary>

    1. On the machine that I want to connect to:

    ```sudo apt install xrdp```

    2. Then to check if installation is correct:

    ```sudo systemctl status xrdp``` 

    3. Then, start de xrdp server:

    ```sudo systemctl start xrdp```

    4. If the `start` command above is complaining about the port, we need to change port:

    ```sudo nvim /etc/xrdp/xrdp.ini```

    Then add at this config `port=3445`

    5. Remember to allow on `ufw` the new port set:

    ```sudo ufw allow 3445```
</details>
<details>
   <summary>4. How to connect to other computer that has RDP server</summary>

    ```xfreerdp /w:1336 /h:900 /u:iago /v:192.168.3.135 /p:<PASSWORD_HERE> /port:3445 +clipboard```
    
</details>
<details>
   <summary>4. Make notebook LID do nothing on close</summary>

    Open config file:

    ```sudo nvim /etc/systemd/logind.conf```

    Then add `HandleLidSwitch=ignore` on this file (without comments obviously)
    Then `Reboot`
    
</details>

---
 
### Important packages:

#### System:
| Packages  | Description |
| ------------- |:-------------:|
| network-manager| _if distro is ubuntu server__ |
| bspwm | empty |
| sxhkd | _comes with bspwm_ |
| lxrandr | empty |
| rofi | empty |
| picom | empty |
| xterm | _initial installation must be with this term, change at `sxhkd` if there is some problem with alacritty_ |
| polybar | empty |
| feh | empty |
| alacritty | empty |
| net-tools | empty |
| curl | empty |
| git | empty |
| nvim (nightly) | empty |
| lazy.nvim | empty |
| zsh | empty |
| ohmyzsh | empty |
| thunar | _gui file manager_ |
     

#### Languages
| Packages  | Description |
| ------------- |:-------------:|
| node | empty |
| rust | empty |
| go | empty |
| cargo-watch | _to watch file changes to faster development_ |
| rust-scripts  | *OBRIGATORY!!! POLYBAR NEED IT TO WORK CORRECTLY* |
     

#### Webcam/Audio/Bluetooth
| Packages  | Description |
| ------------- |:-------------:|
| alsa-utils | _CLI for audio volumes_ |
| pavucontrol | _UI for audio_ |
| headsetcontrol | _CLI to control logitech headset_ |
| bluez | _(https://wiki.archlinux.org/title/Bluetooth)_ |
| bluez-utils  | _bluetooth utils, required_ |
| blueman | _UI for bluetooth, cmd is `blueman-manager`_ |
| guvcview | _webcam visualization_ |
     

#### Mouse
| Packages  | Description |
| ------------- |:-------------:|
| solaar | _UI to change logitech mouse configs_ |
     

#### Tools/Automations
| Packages  | Description |
| ------------- |:-------------:|
| xdotool | _sometimes usefull for some automation with mouse and keyboard_ |
| ripgrep | empty |
| fd | _find files command, on ubuntu server is `fd-find`_ |
| jq | _cli to be a god with many formats. Ex: json_ |
| ranger | _terminal file manager_ |
| fzf | _fuzzyfinder_ |
     

#### Remote Control/RDP
| Packages  | Description |
| ------------- |:-------------:|
| xfreerdp | _used to connect to other computer with RDP client_ |
     

#### Container/Cloud
| Packages  | Description |
| ------------- |:-------------:|
| podman  | _(or docker)_ |
| aws-cli | empty |
| azure-cli | empty |
| terraform | empty |
| kubectl | empty |
| helm | empty |
    
#### Printscreen: 
| Packages  | Description |
| ------------- |:-------------:|
| flameshot | empty |

#### Cheatsheet to remember:
- To open terminal network selector: ``nmtui```
- To open network command: nm-connection-editor

---

### IMPORTANT ACTION ON ARCH: 
Allow development packages:
```sudo pacman -S --needed base-devel```
Add this line into sudoers file: 
```sudo visudo```
```%iago ALL=(ALL:ALL) NOPASSWD: ALL```

---
