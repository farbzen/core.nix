status is-login; and begin
    # Login shell initialisation
end

status is-interactive; and begin

    # Aliases
    alias cd z
    alias egrep 'egrep --color=auto'
    alias eza 'eza --git'
    alias fgrep 'fgrep --color=auto'
    alias grep 'grep --color=auto'
    alias la 'eza --icons -a'
    alias ll 'eza --icons -la'
    alias lla 'eza -la'
    alias ls 'eza --icons'
    alias lt 'eza --tree'
    alias y yazi
    alias yy yazi

    # Interactive shell initialisation
    fzf --fish | source

    fish_config theme choose rose-pine

    function fish_hybrid_key_bindings
        for mode in default insert visual
            fish_default_key_bindings -M $mode
        end
        fish_vi_key_bindings --no-erase
    end
    set -g fish_key_bindings fish_hybrid_key_bindings

    function fish_greeting
        hyfetch
    end

    zoxide init fish | source

    if test "$TERM" != dumb
        starship init fish | source
    end

    pay-respects fish --alias | source

    if not functions -q __direnv_export_eval
        direnv hook fish | source
    end
end
