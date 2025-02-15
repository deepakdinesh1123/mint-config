{ config, pkgs, ... }:

let 
  homeDir = "/home/deepak";
in rec
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "deepak";
  home.homeDirectory = homeDir;
  
  imports = [
    ./system
  ];

  nixpkgs.config.allowUnfreePredicate = _: true;
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
  home.packages = with pkgs; [
    vim
    brave
    sqlc
    go_1_22
    xdg-desktop-portal-xapp
    bruno
    nix-init
    gopls
    go-tools
    qemu
    vagrant
    gopls
    obsidian
    thefuck
    dbeaver-bin
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
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
  #  /etc/profiles/per-user/deepak/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    BROWSER = "${homeDir}/.nix-profile/bin/brave";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  # Firefox
  programs.firefox = {
    enable = true;
  };
  programs.git = {
    enable = true;
    userEmail = "d.deepakdinesh13@gmail.com";
    userName = "deepakdinesh1123";
  };
  programs.gh = {
    enable = true;
  };
  programs.vscode = {
    enable = true;
    userSettings = {
      "[nix]"."editor.tabSize" = 2;
      "[sql]"."editor.tabSize" = 2;
    };
    extensions = with pkgs.vscode-extensions; [
      golang.go
      bbenoist.nix
      ms-azuretools.vscode-docker
    ];
  };
}
