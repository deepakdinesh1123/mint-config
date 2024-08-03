{ pkgs, ... }:
let 
 #bashrc = builtins.readFile ./.bashrc;
 profile = builtins.readFile ./.profile;
in 
{
 programs.bash = {
    enable = true;
   #bashrcExtra = bashrc ;
    profileExtra = profile;
 };
}
