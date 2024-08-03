{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting.enable = true;
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" "docker" "gh" "golang" "vagrant" ];
      theme = "half-life";
    };
    initExtra = ''
        bindkey ^R history-incremental-search-backward 
        bindkey ^S history-incremental-search-forward
    '';
  };
}