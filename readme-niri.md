### Installation
<details>
  <summary>Install command</summary>

    ```sh
    sudo apt install git curl zsh ohmyzsh ranger fzf ripgrep fd-find jq \
        wl-clipboard guvcview solaar
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

TODO

---
 
### Important packages:

#### Languages
| Packages  | Description |
| ------------- |:-------------:|
| node | empty |
| rust | empty |
| go | empty |

#### Webcam/Audio/Bluetooth
| Packages  | Description |
| ------------- |:-------------:|
| guvcview | _webcam visualization_ |
     
#### Mouse
| Packages  | Description |
| ------------- |:-------------:|
| solaar | _UI to change logitech mouse configs_ |
     
#### Tools/Automations
| Packages  | Description |
| ------------- |:-------------:|
| ripgrep | empty |
| fd | _find files command, on ubuntu server is `fd-find`_ |
| jq | _cli to be a god with many formats. Ex: json_ |
| ranger | _terminal file manager_ |
| fzf | _fuzzyfinder_ |
     
#### Container/Cloud
| Packages  | Description |
| ------------- |:-------------:|
| podman  | _(or docker)_ |
    
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
