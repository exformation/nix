My personal NixOS config using flakes:  
```
git clone https://github.com/exformation/nix.git ~/nix \
    && cd ~/nix \
    && sudo nixos-rebuild switch --flake '.#exform'
```