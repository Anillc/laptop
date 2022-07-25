{ pkgs, lib, ... }:

with builtins;
with lib;

{
  xsession = {
    enable = true;
    numlock.enable = true;
  };
  services.polybar = {
    enable = true;
    script = "polybar example &";
    config = ./polybar.ini;
  };
  programs.kitty = {
    enable = true;
    font = {
      name = "jetbrains mono";
      size = 12;
    };
    settings = {
      background = "#111111";
      background_opacity = "0.8";
    };
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.fish ={
    enable = true;
    shellInit = ''
      export TERM=xterm
      alias pb="curl --data-binary @- https://pb.nichi.co/"
    '';
    plugins = [
      {
        name = "git";
        src = pkgs.fetchFromGitHub {
          owner = "jhillyerd";
          repo = "plugin-git";
          rev = "2a3e35c05bdc5b9005f917d5281eb866b2e13104";
          sha256 = "sha256-tWiGIB6yHfZ+QSNJrahHxRQCIOaOlSNFby4bGIOIwic=";
        };
      }
    ];
  };
  programs.starship.enable = true;
  programs.gpg.enable = true;
  services.gpg-agent.enable = true;
  home.stateVersion = "22.05";
}
