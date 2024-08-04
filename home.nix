{ config, lib, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "felix";
  home.homeDirectory = "/home/felix";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.

  
# Install TPM
  home.file.".tmux/plugins/tpm".source = pkgs.fetchFromGitHub {
    owner = "tmux-plugins";
    repo = "tpm";
    rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";  # Latest commit as of my knowledge cutoff
    sha256 = "sha256-hW8mfwB8F9ZkTQ72WQp/1fy8KL1IIYMZBtZYIwZdMQc=";
  };

  home.file."Uni/.gitconfig" = {
  text = ''
    [user]
      name = "Felix Wensky"
      email = "felix.wensky@st.oth-regensburg.de"
  '';
  };

  # TODO: 
  # home.file.".vpn/openfortivpn/oth".text = ''
  #   host = sslvpn.oth-regensburg.de
  #   realm = vpn-default
  #   port = 443
  #   trusted-cert = 2d93980ff2351c71f8721f554df368bdd38bfcfe3b28f67e19b898623f09d7f2
  #   username = wef41751
  #   password =
  # '';

  home.file = {
    # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # symlink to the Nix store copy. ".screenrc".source = dotfiles/screenrc;

    # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/felix/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "xterm-256color";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs = {
    git = {
      enable = true;
      userName = "Felix Wensky";
      userEmail = "felix.wensky@gmail.com";
    };

    spotify-player = {
      enable = true;
      keymaps = [
        {
          command = "None";
          key_sequence = "q";
        }
        {
          command = "Quit";
          key_sequence = "C-x C-c";
        }
        {
          command = "FocusNextWindow";
          key_sequence = "l";
        }
        {
          command = "FocusPreviousWindow";
          key_sequence = "h";
        }
        {
          command = "LyricPage";
          key_sequence = "g L";
        }
      ];
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        nv = "nvim";
        nix-rebuild = "${pkgs.zsh}/bin/zsh -c 'sudo nixos-rebuild switch --flake ~/.config/nixos/#defaultNixos'";
        nix-on-rebuild = "~/.config/nixos/push_on_update.sh";
        nix-update = "nix-rebuild && nix-on-rebuild";
        # oth-connect = "sudo openfortivpn -c ~/.vpn/openfortivpn/oth";
      };
      initExtra = ''
        # Enable correction
        setopt CORRECT
        setopt CORRECT_ALL

        # Set maximum number of corrections to ask about
        SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color? ([Y]es/[N]o/[E]dit/[A]bort) "

        # Set correction prompt style
        zstyle ':completion:*' completer _complete _match _approximate
        zstyle ':completion:*:match:*' original only
        zstyle ':completion:*:approximate:*' max-errors 1 numeric

        # Ignore specific commands for correction
        alias mv='nocorrect mv'
        alias cp='nocorrect cp'
        alias mkdir='nocorrect mkdir'

        # Set the prompt
        export PROMPT='%F{blue}%n%f | %F{white}%~%f> '
        export TERM="xterm-256color"

        # zoxide remap
        eval "$(zoxide init --cmd cd zsh)"
      '';   
      };

    alacritty = {
      enable = true;
      settings = {
        shell = {
          program = "${pkgs.zsh}/bin/zsh";
        };
        window = {
          opacity = 0.9;
          padding = {
            x = 10;
            y = 10;
          };
          decorations = "full";
          title = "Terminal";
          dynamic_title = true;
        };
        font = {
          normal = {
            family = "JetBrainsMono NFM";
            style = "Regular";
          };
          size = 11.0;
        };
        colors = {
          primary = {
            background = "#282c34";
            foreground = "#abb2bf";
          };
        };
      };
    };

    tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    prefix = "C-Space";
    baseIndex = 1;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    aggressiveResize = true;
    escapeTime = 0;
    historyLimit = 50000;
    clock24 = true;
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Enable mouse support
      set -g mouse on

      # Relabel indexes
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Enable activity alerts
      setw -g monitor-activity on
      set -g visual-activity on

      # Center the window list
      set -g status-justify centre

      # Vim style copy mode
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

      # Pane navigation
      bind-key 'h' select-pane -L
      bind-key 'j' select-pane -D
      bind-key 'k' select-pane -U
      bind-key 'l' select-pane -R

      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      # TPM plugins
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'christoomey/vim-tmux-navigator'
      set -g @plugin 'tmux-plugins/tmux-yank'
      set -g @plugin 'dreamsofcode-io/catppuccin-tmux'

      # keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
      run '~/.tmux/plugins/tpm/tpm'
    '';
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      yank
    ];
  };


    neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "gruvbox_dark_v2";
        vim_keys = true;
      };
    };

    firefox = {
      enable = true;
      profiles.felix = {
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          bitwarden
          ublock-origin
          sponsorblock
          youtube-shorts-block
        ];
      };
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value= true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "always";
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"

        # not sure if this even works
        # Preferences = { 
        #   "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
        #   "extensions.pocket.enabled" = false;
        #   "extensions.screenshots.disabled" = true;
        #   "browser.topsites.contile.enabled" = false;
        #   "browser.formfill.enable" = false;
        #   "browser.search.suggest.enabled" = true;
        #   "browser.search.suggest.enabled.private" = true;
        #   "browser.urlbar.suggest.searches" = true;
        #   "browser.urlbar.showSearchSuggestionsFirst" = false;
        #   "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        #   "browser.newtabpage.activity-stream.feeds.snippets" = false;
        #   "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        #   "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
        #   "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
        #   "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
        #   "browser.newtabpage.activity-stream.showSponsored" = false;
        #   "browser.newtabpage.activity-stream.system.showSponsored" = false;
        #   "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        # };
      };
    };
  };
}
