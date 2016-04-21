#!/bin/bash

fscrn=$(mktemp --tmpdir XXXX.png)

# requires graphicsmagick for better performance (erase <gm> to use imagemagick)
scrot $fscrn
#xset dpms force off
#gm mogrify -colorspace gray -blur 0x3 $fscrn
#gm mogrify -blur 0x4 $fscrn
#gm mogrify -scale 50% -blur 0x2 -scale 200% $fscrn
gm mogrify -scale 10% -scale 1000% $fscrn
#gm mogrify -scale 10% -scale $(identify -format "%wx%h" $fscrn)\! $fscrn

i3lock -ui $fscrn
rm $fscrn
