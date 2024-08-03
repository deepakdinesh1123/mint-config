{ pkgs, ...}:
{
  services.fusuma = {
    enable = true;
    extraPackages = with pkgs; [ xdotool coreutils xorg.xprop ];
    settings = {
      threshold = {
        swipe = 0.1;
      };
      interval = {
        swipe = 0.7;
      };
      swipe = {
        "3" = {
         left = {
            # GNOME: Switch to left workspace
            command = "xdotool key ctrl+alt+Right";
          };
        };
      };
    };
  };
}
