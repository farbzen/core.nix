{
  flake.nixosModules.muxTmux = {pkgs, ...}: {
    programs.tmux = {
          enable = true;
      extraConfig = ''
        set-option -gq allow-passthrough on
        set -g @tmux-dotbar-bg default
      '';

      plugins = with pkgs.tmuxPlugins; [
        better-mouse-mode
        dotbar
        sensible
      ];
    };
  };
}
