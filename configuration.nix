# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.catppuccin.nixosModules.catppuccin
    inputs.xremap-flake.nixosModules.default
  ];

  # Bootloader.
  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda"; # or "nodev" for EFI only
      useOSProber = true;
      gfxmodeEfi = "1920x1080";
      gfxmodeBios = "1920x1080";
      gfxpayloadEfi = "keep";
      gfxpayloadBios = "keep";

      # Catppuccin theme configuration
      theme = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "grub";
        rev =
          "f4b254776afd4c76e44e7c406e0b2631694a0343"; # Replace with the latest commit hash
        sha256 =
          "/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0="; # Replace with the correct SHA256
      } + "/src/catppuccin-mocha-grub-theme";

      # If you want to customize the colors
      extraConfig = ''
        set menu_color_normal=white/black
        set menu_color_highlight=black/light-blue
      '';

    };
    plymouth = {
      enable = true;
      theme = "tribar"; # You can choose other themes like "breeze" or "bgrt"
    };
    kernelParams =
      [ "quiet" "splash" "plymouth.ignore-serial-consoles" "video=1920x1080" ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  services.xremap = {
    userName = "felix";
    config = {
      keymap = [{
        name = "main remaps";
        remap = {
          super-t = { launch = [ "wezterm" ]; };
          "CapsLock" = "esc";
        };
      }];
    };

  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # test 

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.felix = {
    isNormalUser = true;
    description = "Felix";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin = {
    enable = true;
    user = "felix";
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Install firefox.
  programs.firefox.enable = true;

  # Enable zsh globally
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home-manager.backupFileExtension = "backup";

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.felix = {
      imports = [ inputs.catppuccin.homeManagerModules.catppuccin ./home.nix ];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #nix
    home-manager

    #boot
    plymouth
    catppuccin-plymouth

    #desktop
    gnome-tweaks

    #terminal
    fzf
    ripgrep
    tree-sitter
    fd
    btop
    bat

    #development
    # langs
    python3

    #linters
    statix
    yamllint

    #formatters
    codespell
    nixfmt
    rustfmt
    stylua
    black
    yamllint

    #debuggers
    gdb

    # packagemanagers
    cargo
    luarocks

    # buildtools
    gcc
    gnumake
    clang
    nodejs

    # utils
    git

    #uni
    obsidian
    openfortivpn
    dbeaver-bin

    #utils
    zip
    unzip
    fastfetch
    speedtest-go
    tlrc
    openvpn
    wget
    xclip

    #applications
    spotify
    thunderbird
    inputs.zen-browser.packages."${system}".specific
    whatsapp-for-linux
    vesktop
    discord
    portfolio
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon. # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
