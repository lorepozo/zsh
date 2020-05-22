# if we have a screen, we can try a colored screen
if [[ "$TERM" == "screen" ]]; then
    export TERM="screen-256color"
fi
