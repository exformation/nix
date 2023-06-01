{ config, lib, pkgs, user, version, home-manager, ... }@inputs: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./services.nix
    ../home/home.nix
  ];

  sound = { enable = true; };
  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
    opengl.enable = true;
  };
  boot = {
    loader = {
      timeout = 5;
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    useDHCP = false;
  };
  time = { timeZone = "America/Chicago"; };
  i18n = { defaultLocale = "en_US.utf8"; };
  security = {
    rtkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };
  # sudo nmcli dev wifi connect "..." password "..."
  users = {
    defaultUserShell = pkgs.zsh;
    users."${user}" = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        # TODO: only active during flutter development? 
        "adbusers"
        # TODO: only active for pedd user?
        "input"
        "uinput"
      ];
    };
  };
  programs = {
    # adb.enable = true;
    zsh.enable = true;
  };
  nixpkgs = { config.allowUnfree = true; };
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "kitty";
      SHELL = "zsh";
      PAGER = "less";
      BROWSER = "firefox";
    };
    shells = with pkgs; [ zsh ];
  };
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    package = pkgs.nixVersions.unstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = { auto-optimise-store = true; };
  };
  system.stateVersion = "${version}";

  # systemd.services.bouncekeys = {
  #   description = "Fix chatter on laptop";
  #   wantedBy = [ "default.target" ];
  #   after = [ "graphical-session.target" ];
  #   restartIfChanged = false;
  #   serviceConfig = {
  #     Restart = "on-failure";
  #     # ExecStart = "${pkgs.kanata}/bin/kanata -c /home/${user}/.config/kanata/kanata.kbd";
  #     ExecStart = "${pkgs.kanata}/bin/xkbset bo 50";
  #   };
  # };
}
