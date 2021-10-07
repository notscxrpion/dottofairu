if [[ "$(tty)" = "/dev/tty1" ]]; then
        pgrep awesome || sx
fi

export QT_QPA_PLATFORMTHEME=qt5ct

