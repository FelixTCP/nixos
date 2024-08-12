{ config, lib, pkgs, inputs, ... }:

{

  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

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

  home.file = {

    # Install TPM
    ".tmux/plugins/tpm".source = pkgs.fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tpm";
      rev =
        "99469c4a9b1ccf77fade25842dc7bafbc8ce9946"; # Latest commit as of my knowledge cutoff
      sha256 = "sha256-hW8mfwB8F9ZkTQ72WQp/1fy8KL1IIYMZBtZYIwZdMQc=";
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

    "Uni/.gitconfig" = {
      text = ''
        [user]
          name = "Felix Wensky"
          email = "felix.wensky@st.oth-regensburg.de"
      '';
    };

    #Vesktop
    ".config/vesktop/settings/settings.json" = {
      text = ''
                    {
            "autoUpdate": true,
            "autoUpdateNotification": true,
            "useQuickCss": true,
            "themeLinks": [
                "https://raw.githubusercontent.com/DiscordStyles/HorizontalServerList/deploy/HorizontalServerList.theme.css",
                "https://raw.githubusercontent.com/TheCommieAxolotl/BetterDiscord-Stuff/main/Ultra/Ultra.theme.css",
                "https://raw.githubusercontent.com/TheCommieAxolotl/BetterDiscord-Stuff/main/Ultra/Ultra.json",
                "https://raw.githubusercontent.com/TheCommieAxolotl/BetterDiscord-Stuff/main/Ultra/Ultra.css",
                "https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/master/Themes/SettingsModal/SettingsModal.theme.css"
            ],
            "enabledThemes": [],
            "enableReactDevtools": false,
            "frameless": false,
            "transparent": false,
            "winCtrlQ": false,
            "disableMinSize": false,
            "winNativeTitleBar": false,
            "plugins": {
                "BadgeAPI": {
                    "enabled": true
                },
                "ChatInputButtonAPI": {
                    "enabled": false
                },
                "CommandsAPI": {
                    "enabled": true
                },
                "ContextMenuAPI": {
                    "enabled": true
                },
                "MemberListDecoratorsAPI": {
                    "enabled": true
                },
                "MessageAccessoriesAPI": {
                    "enabled": true
                },
                "MessageDecorationsAPI": {
                    "enabled": true
                },
                "MessageEventsAPI": {
                    "enabled": true
                },
                "MessagePopoverAPI": {
                    "enabled": false
                },
                "NoticesAPI": {
                    "enabled": true
                },
                "ServerListAPI": {
                    "enabled": true
                },
                "NoTrack": {
                    "enabled": true,
                    "disableAnalytics": true
                },
                "Settings": {
                    "enabled": true,
                    "settingsLocation": "aboveNitro"
                },
                "SupportHelper": {
                    "enabled": true
                },
                "AlwaysAnimate": {
                    "enabled": false
                },
                "AlwaysTrust": {
                    "enabled": false
                },
                "AnonymiseFileNames": {
                    "enabled": false
                },
                "WebRichPresence (arRPC)": {
                    "enabled": false
                },
                "AutomodContext": {
                    "enabled": false
                },
                "BANger": {
                    "enabled": false
                },
                "BetterFolders": {
                    "enabled": false
                },
                "BetterGifAltText": {
                    "enabled": false
                },
                "BetterGifPicker": {
                    "enabled": false
                },
                "BetterNotesBox": {
                    "enabled": false
                },
                "BetterRoleContext": {
                    "enabled": false
                },
                "BetterRoleDot": {
                    "enabled": false
                },
                "BetterSessions": {
                    "enabled": false
                },
                "BetterSettings": {
                    "enabled": true,
                    "disableFade": true,
                    "eagerLoad": true
                },
                "BetterUploadButton": {
                    "enabled": false
                },
                "BiggerStreamPreview": {
                    "enabled": false
                },
                "BlurNSFW": {
                    "enabled": false
                },
                "CallTimer": {
                    "enabled": false
                },
                "ClearURLs": {
                    "enabled": true
                },
                "ClientTheme": {
                    "enabled": false
                },
                "ColorSighted": {
                    "enabled": false
                },
                "ConsoleShortcuts": {
                    "enabled": false
                },
                "CopyUserURLs": {
                    "enabled": false
                },
                "CrashHandler": {
                    "enabled": true
                },
                "CtrlEnterSend": {
                    "enabled": false
                },
                "CustomRPC": {
                    "enabled": false
                },
                "CustomIdle": {
                    "enabled": false
                },
                "Dearrow": {
                    "enabled": false
                },
                "Decor": {
                    "enabled": false
                },
                "DisableCallIdle": {
                    "enabled": false
                },
                "EmoteCloner": {
                    "enabled": false
                },
                "Experiments": {
                    "enabled": false,
                    "enableIsStaff": false
                },
                "F8Break": {
                    "enabled": false
                },
                "FakeNitro": {
                    "enabled": true,
                    "enableEmojiBypass": true,
                    "enableStickerBypass": true,
                    "enableStreamQualityBypass": true,
                    "transformEmojis": true,
                    "transformStickers": true,
                    "transformCompoundSentence": false
                },
                "FakeProfileThemes": {
                    "enabled": false
                },
                "FavoriteEmojiFirst": {
                    "enabled": false
                },
                "FavoriteGifSearch": {
                    "enabled": false
                },
                "FixCodeblockGap": {
                    "enabled": true
                },
                "FixSpotifyEmbeds": {
                    "enabled": false
                },
                "FixYoutubeEmbeds": {
                    "enabled": false
                },
                "ForceOwnerCrown": {
                    "enabled": false
                },
                "FriendInvites": {
                    "enabled": false
                },
                "FriendsSince": {
                    "enabled": true
                },
                "GameActivityToggle": {
                    "enabled": false
                },
                "GifPaste": {
                    "enabled": false
                },
                "GreetStickerPicker": {
                    "enabled": false
                },
                "HideAttachments": {
                    "enabled": false
                },
                "iLoveSpam": {
                    "enabled": false
                },
                "IgnoreActivities": {
                    "enabled": false
                },
                "ImageLink": {
                    "enabled": false
                },
                "ImageZoom": {
                    "enabled": true,
                    "size": 671.1538461538462,
                    "zoom": 26.128205128205124,
                    "nearestNeighbour": true,
                    "square": false,
                    "saveZoomValues": true,
                    "zoomSpeed": 1.6391025641025643
                },
                "ImplicitRelationships": {
                    "enabled": true,
                    "sortByAffinity": true
                },
                "InvisibleChat": {
                    "enabled": false
                },
                "KeepCurrentChannel": {
                    "enabled": false
                },
                "LastFMRichPresence": {
                    "enabled": false
                },
                "LoadingQuotes": {
                    "enabled": false,
                    "replaceEvents": true
                },
                "MemberCount": {
                    "enabled": true,
                    "memberList": true,
                    "toolTip": true
                },
                "MessageClickActions": {
                    "enabled": false
                },
                "MessageLatency": {
                    "enabled": false
                },
                "MessageLinkEmbeds": {
                    "enabled": true
                },
                "MessageLogger": {
                    "enabled": false
                },
                "MessageTags": {
                    "enabled": false
                },
                "MoreCommands": {
                    "enabled": false
                },
                "MoreKaomoji": {
                    "enabled": false
                },
                "MoreUserTags": {
                    "enabled": false
                },
                "Moyai": {
                    "enabled": false,
                    "volume": 0.5,
                    "quality": "Normal",
                    "triggerWhenUnfocused": true,
                    "ignoreBots": true,
                    "ignoreBlocked": true
                },
                "MutualGroupDMs": {
                    "enabled": false
                },
                "NewGuildSettings": {
                    "enabled": false
                },
                "NoBlockedMessages": {
                    "enabled": false
                },
                "NoDefaultHangStatus": {
                    "enabled": false
                },
                "NoDevtoolsWarning": {
                    "enabled": false
                },
                "NoF1": {
                    "enabled": false
                },
                "NoMosaic": {
                    "enabled": false,
                    "inlineVideo": true
                },
                "NoPendingCount": {
                    "enabled": false
                },
                "NoProfileThemes": {
                    "enabled": false
                },
                "NoReplyMention": {
                    "enabled": false
                },
                "NoScreensharePreview": {
                    "enabled": false
                },
                "NoServerEmojis": {
                    "enabled": true
                },
                "NoTypingAnimation": {
                    "enabled": false
                },
                "NoUnblockToJump": {
                    "enabled": false
                },
                "NormalizeMessageLinks": {
                    "enabled": false
                },
                "NotificationVolume": {
                    "enabled": false
                },
                "NSFWGateBypass": {
                    "enabled": false
                },
                "OnePingPerDM": {
                    "enabled": false
                },
                "oneko": {
                    "enabled": false
                },
                "OpenInApp": {
                    "enabled": false
                },
                "OverrideForumDefaults": {
                    "enabled": false
                },
                "PartyMode": {
                    "enabled": false,
                    "superIntensePartyMode": 0
                },
                "PauseInvitesForever": {
                    "enabled": false
                },
                "PermissionFreeWill": {
                    "enabled": false
                },
                "PermissionsViewer": {
                    "enabled": false
                },
                "petpet": {
                    "enabled": false
                },
                "PictureInPicture": {
                    "enabled": false,
                    "loop": true
                },
                "PinDMs": {
                    "enabled": true,
                    "pinOrder": 0,
                    "dmSectioncollapsed": false
                },
                "PlainFolderIcon": {
                    "enabled": true
                },
                "PlatformIndicators": {
                    "enabled": true,
                    "colorMobileIndicator": true,
                    "list": true,
                    "badges": true,
                    "messages": true
                },
                "PreviewMessage": {
                    "enabled": false
                },
                "PronounDB": {
                    "enabled": false
                },
                "QuickMention": {
                    "enabled": false
                },
                "QuickReply": {
                    "enabled": true
                },
                "ReactErrorDecoder": {
                    "enabled": false
                },
                "ReadAllNotificationsButton": {
                    "enabled": true
                },
                "RelationshipNotifier": {
                    "enabled": false
                },
                "ReplaceGoogleSearch": {
                    "enabled": false
                },
                "ReplyTimestamp": {
                    "enabled": false
                },
                "ResurrectHome": {
                    "enabled": false
                },
                "RevealAllSpoilers": {
                    "enabled": false
                },
                "ReverseImageSearch": {
                    "enabled": false
                },
                "ReviewDB": {
                    "enabled": false
                },
                "RoleColorEverywhere": {
                    "enabled": false
                },
                "SearchReply": {
                    "enabled": false
                },
                "SecretRingToneEnabler": {
                    "enabled": false
                },
                "SendTimestamps": {
                    "enabled": false,
                    "replaceMessageContents": true
                },
                "ServerListIndicators": {
                    "enabled": true,
                    "mode": 2
                },
                "ShikiCodeblocks": {
                    "enabled": true,
                    "theme": "https://raw.githubusercontent.com/shikijs/shiki/0b28ad8ccfbf2615f2d9d38ea8255416b8ac3043/packages/shiki/themes/solarized-dark.json",
                    "tryHljs": "SECONDARY",
                    "useDevIcon": "COLOR",
                    "bgOpacity": 0,
                    "customTheme": "https://raw.githubusercontent.com/FelixTCP/catppuccin-mocha/main/mocha.json"
                },
                "ShowAllMessageButtons": {
                    "enabled": true
                },
                "ShowConnections": {
                    "enabled": false
                },
                "ShowHiddenChannels": {
                    "enabled": false
                },
                "ShowHiddenThings": {
                    "enabled": false
                },
                "ShowMeYourName": {
                    "enabled": true,
                    "mode": "user",
                    "displayNames": false,
                    "inReplies": false
                },
                "ShowTimeoutDuration": {
                    "enabled": false
                },
                "SilentMessageToggle": {
                    "enabled": false
                },
                "SilentTyping": {
                    "enabled": false
                },
                "SortFriendRequests": {
                    "enabled": false
                },
                "SpotifyControls": {
                    "enabled": true,
                    "hoverControls": false
                },
                "SpotifyCrack": {
                    "enabled": false
                },
                "SpotifyShareCommands": {
                    "enabled": true
                },
                "StartupTimings": {
                    "enabled": false
                },
                "StreamerModeOnStream": {
                    "enabled": false
                },
                "SuperReactionTweaks": {
                    "enabled": false
                },
                "TextReplace": {
                    "enabled": true
                },
                "ThemeAttributes": {
                    "enabled": false
                },
                "TimeBarAllActivities": {
                    "enabled": false
                },
                "Translate": {
                    "enabled": false
                },
                "TypingIndicator": {
                    "enabled": false
                },
                "TypingTweaks": {
                    "enabled": false
                },
                "Unindent": {
                    "enabled": false
                },
                "UnlockedAvatarZoom": {
                    "enabled": false
                },
                "UnsuppressEmbeds": {
                    "enabled": false
                },
                "UrbanDictionary": {
                    "enabled": false
                },
                "UserVoiceShow": {
                    "enabled": false
                },
                "USRBG": {
                    "enabled": false
                },
                "ValidReply": {
                    "enabled": false
                },
                "ValidUser": {
                    "enabled": false
                },
                "VoiceChatDoubleClick": {
                    "enabled": false
                },
                "VcNarrator": {
                    "enabled": false
                },
                "VencordToolbox": {
                    "enabled": false
                },
                "ViewIcons": {
                    "enabled": true,
                    "format": "webp",
                    "imgSize": "1024"
                },
                "ViewRaw": {
                    "enabled": false
                },
                "VoiceDownload": {
                    "enabled": false
                },
                "VoiceMessages": {
                    "enabled": true
                },
                "WebContextMenus": {
                    "enabled": true,
                    "addBack": true
                },
                "WebKeybinds": {
                    "enabled": true
                },
                "WebScreenShareFixes": {
                    "enabled": true
                },
                "WhoReacted": {
                    "enabled": false
                },
                "Wikisearch": {
                    "enabled": false
                },
                "XSOverlay": {
                    "enabled": false
                },
                "MessageUpdaterAPI": {
                    "enabled": true
                },
                "DontRoundMyTimestamps": {
                    "enabled": false
                },
                "MaskedLinkPaste": {
                    "enabled": false
                },
                "ServerInfo": {
                    "enabled": true
                },
                "AppleMusicRichPresence": {
                    "enabled": false
                },
                "CopyEmojiMarkdown": {
                    "enabled": false
                },
                "NoOnboardingDelay": {
                    "enabled": false
                },
                "Summaries": {
                    "enabled": false
                },
                "SettingsStoreAPI": {
                    "enabled": true
                },
                "UserSettingsAPI": {
                    "enabled": true
                },
                "ConsoleJanitor": {
                    "enabled": false
                },
                "ShowAllRoles": {
                    "enabled": false
                },
                "YoutubeAdblock": {
                    "enabled": true
                },
                "MentionAvatars": {
                    "enabled": false
                }
            },
            "notifications": {
                "timeout": 5000,
                "position": "bottom-right",
                "useNative": "not-focused",
                "logLimit": 50
            },
            "cloud": {
                "authenticated": false,
                "url": "https://api.vencord.dev/",
                "settingsSync": false,
                "settingsSyncVersion": 1722967809259
            }
        }
      '';
    };
  };

  # Building this configuration will create a copy of 'dotfiles/screenrc' in
  # the Nix store. Activating the configuration will then make '~/.screenrc' a
  # symlink to the Nix store copy. ".screenrc".source = dotfiles/screenrc;

  # You can also set the file content immediately.
  # ".gradle/gradle.properties".text = ''
  #   org.gradle.console=verbose
  #   org.gradle.daemon.idletimeout=3600000
  # '';

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

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    globals.mapleader = " ";
    globals.have_nerd_font = true;

    extraConfigLua = ''
      vim.api.nvim_set_keymap('n', '<F12>', ':verbose map<CR>', {noremap = true, silent = true})
    '';

    # Basic options
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      clipboard = "unnamedplus";
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;

      inccommand = "split";
      scrolloff = 10;
      hlsearch = true;

      shiftwidth = 2;
      expandtab = true;
      cursorline = true;
      termguicolors = true;
    };

    keymaps = [
      {
        action = "<cmd>:Oil<CR>";
        key = "-";
        mode = [ "n" ];
        options = { desc = "Open parent directory"; };
      }
      {
        action = "<cmd>:UndotreeToggle<CR>";
        key = "<F5>";
        mode = [ "i" "n" "v" ];
      }
      {
        action = "<cmd>:Telescope git_status<CR>";
        key = "<leader>gd";
        mode = [ "n" ];
        options = { desc = "Search [D]iffs"; };
      }
      {
        action = "<cmd>:Telescope git_branches<CR>";
        key = "<leader>gb";
        mode = [ "n" ];
        options = { desc = "Search [B]ranches"; };
      }
      {
        action = "<cmd>:Telescope git_commits<CR>";
        key = "<leader>gc";
        mode = [ "n" ];
        options = { desc = "Search [C]ommits"; };
      }
      {
        action = "<cmd>:Gitsigns toggle_deleted<CR>";
        key = "<leader>gtd";
        mode = [ "n" ];
        options = { desc = "Toggle [D]eleted"; };
      }
      {
        action = "<cmd>:Gitsigns preview_hunk<CR>";
        key = "<leader>gp";
        mode = [ "n" ];
        options = { desc = "[P]review Changes"; };
      }
      {
        action = "<cmd>:Gitsigns reset_hunk<CR>";
        key = "<leader>gr";
        mode = [ "n" ];
        options = { desc = "[R]eset Changes"; };
      }
      {
        action = "<cmd>:Gitsigns stage_hunk<CR>";
        key = "<leader>gs";
        mode = [ "n" ];
        options = { desc = "[S]stage Changes"; };
      }
      {
        action = "<cmd>:Gitsigns undo_stage_hunk<CR>";
        key = "<leader>gu";
        mode = [ "n" ];
        options = { desc = "[U]stage Changes"; };
      }
      {
        action = "<cmd>:Gitsigns prev_hunk<CR>";
        key = "[c";
        mode = [ "n" ];
        options = { desc = "Previous Changes"; };
      }
      {
        action = "<cmd>:Gitsigns next_hunk<CR>";
        key = "]c";
        mode = [ "n" ];
        options = { desc = "Next Changes"; };
      }
    ];

    # Plugins
    plugins = {
      lualine.enable = true;
      oil.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
      fugitive.enable = true;
      todo-comments.enable = true;

      which-key = {
        enable = true;
        settings = {
          replace = {
            desc = [
              [ "<space>" "SPACE" ]
              [ "<leader>" "SPACE" ]
              [ "<[cC][rR]>" "RETURN" ]
              [ "<[tT][aA][bB]>" "TAB" ]
              [ "<[bB][sS]>" "BACKSPACE" ]
            ];
          };
          spec = [
            {
              __unkeyed-1 = "<leader>s";
              group = "Search";
            }
            {
              __unkeyed-1 = "<leader>w";
              group = "Workspace";
            }
            {
              __unkeyed-1 = "<leader>c";
              group = "Code";
            }
            {
              __unkeyed-1 = "<leader>g";
              group = "Git";
            }
          ];
        };
      };

      lsp = {
        enable = true;
        servers = {
          # c / cpp
          clangd.enable = true;
          # nix
          nil-ls.enable = true;
          pyright.enable = true;
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "[G]oto [D]efinition";
            };
            gr = {
              action = "references";
              desc = "[G]oto [R]eferences";
            };
            gD = {
              action = "declaration";
              desc = "[G]oto [D]eclaration";
            };
            gI = {
              action = "implementation";
              desc = "[G]oto [I]mplementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type [D]efinition";
            };
            K = {
              action = "hover";
              desc = "Hover Documentation";
            };
            "<leader>cw" = {
              action = "workspace_symbol";
              desc = "[W]orkspace [S]ymbol";
            };
            "<leader>ca" = {
              action = "code_action";
              desc = "[C]ode [A]ction";
            };
            "<leader>cr" = {
              action = "rename";
              desc = "[R]ename";
            };
          };
          diagnostic = {
            "<leader>cd" = {
              action = "open_float";
              desc = "Line Diagnostics";
            };
            "]d" = {
              action = "goto_next";
              desc = "Next Diagnostic";
            };
            "[d" = {
              action = "goto_prev";
              desc = "Previous Diagnostic";
            };
          };
        };
      };

      lint = {
        enable = true;
        lintersByFt = {
          text = [ "vale" ];
          json = [ "jsonlint" ];
          markdown = [ "vale" ];
          nix = [ "statix" ];
        };
      };

      conform-nvim = {
        enable = true;
        formatOnSave = {
          lspFallback = true;
          timeoutMs = 500;
        };
        notifyOnError = true;
        formattersByFt = {
          html = [[ "prettierd" "prettier" ]];
          css = [[ "prettierd" "prettier" ]];
          javascript = [[ "prettierd" "prettier" ]];
          typescript = [[ "prettierd" "prettier" ]];
          python = [ "black" ];
          lua = [ "stylua" ];
          nix = [ "nixfmt" ];
          markdown = [[ "prettierd" "prettier" ]];
          yaml = [ "yamllint" ];
        };
      };

      cmp = {
        enable = true;
        settings = {
          snippet.expand = "luasnip";
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-e>" = "cmp.mapping.abort()";
            "<Enter>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.confirm({ select = true })";
          };
        };
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>sg" = {
            action = "live_grep";
            options = { desc = "[S]earch with [G]rep"; };
          };
          "<leader>sw" = {
            action = "grep_string";
            options = { desc = "[S]earch current [W]ord"; };
          };
          "<leader>sf" = {
            action = "find_files";
            options = { desc = "[S]earch [F]iles"; };
          };
          "<leader>sd" = {
            action = "diagnostics";
            options = { desc = "[S]earch [D]iagnostics"; };
          };
          "<leader>s." = {
            action = "oldfiles";
            options = { desc = "[S]earch recent Files"; };
          };
        };
        extensions = { ui-select.enable = true; };
      };

      undotree = {
        enable = true;
        settings = {
          CursorLine = true;
          DiffAutoOpen = true;
          DiffCommand = "diff";
          DiffpanelHeight = 24;
          HelpLine = true;
          HighlightChangedText = true;
          HighlightChangedWithSign = true;
          HighlightSyntaxAdd = "DiffAdd";
          HighlightSyntaxChange = "DiffChange";
          HighlightSyntaxDel = "DiffDelete";
          RelativeTimestamp = true;
          SetFocusWhenToggle = true;
          ShortIndicators = false;
          SplitWidth = 50;
          TreeNodeShape = "*";
          TreeReturnShape = "\\";
          TreeSplitShape = "/";
          TreeVertShape = "|";
          WindowLayout = 3;
        };
      };

      gitsigns = {
        enable = true;
        settings = {
          current_line_blame = true;
          current_line_blame_opts = {
            virt_text = true;
            virt_text_pos = "eol";
          };
          signcolumn = true;
          signs = {
            add = { text = "┃"; };
            change = { text = "┃"; };
            changedelete = { text = "~"; };
            delete = { text = "_"; };
            topdelete = { text = "‾"; };
            untracked = { text = "┆"; };
          };
          watch_gitdir = { follow_files = true; };
        };
      };

      mini = {
        enable = true;
        modules = {
          ai = {
            n_lines = 500;
            search_method = "cover_or_next";
          };
          surround = { };
        };
      };

      tmux-navigator = {
        keymaps = [
          {
            action = "left";
            key = "<C-w>h";
          }
          {
            action = "down";
            key = "<C-w>j";
          }
          {
            action = "up";
            key = "<C-w>k";
          }
          {
            action = "right";
            key = "<C-w>l";
          }
          {
            action = "previous";
            key = "<C-w>\\";
          }
        ];
      };
    };
  };

  programs = {
    git = {
      enable = true;
      userName = "Felix Wensky";
      userEmail = "felix.wensky@gmail.com";

      delta = {
        enable = true;
        options = {
          features = "decorations";
          navigate = true;
          light = false; # set to true for light terminal backgrounds
          side-by-side = true;
          line-numbers = true;
          syntax-theme = "Dracula";
          plus-style = "syntax #003800";
          minus-style = "syntax #3f0001";

          decorations = {
            commit-decoration-style = "bold yellow box ul";
            file-style = "bold yellow ul";
            file-decoration-style = "none";
            hunk-header-decoration-style = "cyan box ul";
          };

          hunk-header-file-style = "red";
          hunk-header-line-number-style = "#067a00";
          hunk-header-style = "file line-number syntax";

          file-added-label = "[+]";
          file-copied-label = "[==]";
          file-modified-label = "[*]";
          file-removed-label = "[-]";
          file-renamed-label = "[->]";

          line-numbers-left-style = "cyan";
          line-numbers-right-style = "cyan";
          line-numbers-minus-style = "red";
          line-numbers-plus-style = "green";

          merge-conflict-begin-symbol = "▼";
          merge-conflict-end-symbol = "▲";
          merge-conflict-ours-diff-header-style = "yellow bold";
          merge-conflict-theirs-diff-header-style = "yellow bold italic";

          whitespace-error-style = "reverse red";

          zero-style = "syntax";
        };
      };
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
        cl = "clear";
        nv = "nvim";
        nix-rebuild =
          "${pkgs.zsh}/bin/zsh -c 'sudo nixos-rebuild switch --flake ~/.config/nixos/#defaultNixos'";
        nix-on-rebuild = "~/.config/nixos/push_on_update.sh";
        nix-update = "nix-rebuild && nix-on-rebuild";
        ls =
          "eza --color=always --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions";
        ll =
          "eza --color=always --oneline --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions";
        lt =
          "eza --color=always --tree --level=3 --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions";
        git-loc = "git ls-files | xargs wc -l";
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
                export PATH=$PATH:~/.cargo/bin/

        	#Git ssh-agent
        	env=~/.ssh/agent.env

        	agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

        	agent_start () {
            		(umask 077; ssh-agent >| "$env")
            		. "$env" >| /dev/null ; }
        	
        	agent_load_env

        	# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
        	agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

        	if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
            		agent_start
            		ssh-add
        	elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
           		ssh-add
        	fi

        	unset env


                # zoxide remap
                eval "$(zoxide init --cmd cd zsh)"
      '';
    };

    alacritty = {
      enable = true;
      settings = {
        shell = { program = "${pkgs.zsh}/bin/zsh"; };
        window = {
          startup_mode = "fullscreen";
          opacity = 0.8;
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
          size = 14.0;
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

        # Smart pane switching with awareness of vim splits.
        # See: https://github.com/christoomey/vim-tmux-navigator
        is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"

        bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
        bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
        bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
        bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'

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

        set -g @plugin 'tmux-plugins/tmux-resurrect'
        set -g @plugin 'tmux-plugins/tmux-continuum'
        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '5'

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
      plugins = with pkgs.tmuxPlugins; [ sensible vim-tmux-navigator yank ];
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "gruvbox_dark_v2";
        vim_keys = true;
      };
    };

    atuin = {
      enable = true;
      enableZshIntegration = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
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
          Value = true;
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
        DisplayMenuBar =
          "default-off"; # alternatives: "always", "never" or "default-on"
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
