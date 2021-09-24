if [[ "$(tty)" = "/dev/tty1" ]]; then
        pgrep awesome || sx
fi
