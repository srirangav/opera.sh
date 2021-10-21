#!/bin/sh
#
# script to start opera on MacOSX in incognito mode 
# and with some privacy options enabled
# see: https://peter.sh/experiments/chromium-command-line-switches/

OPERA="/Applications/Opera.app/Contents/MacOS/Opera"
OPERA_OPTS="--disable-plugins-discovery \
            --disable-preconnect \
            --disable-translate \
            --dns-prefetch-disable \
            --no-pings \
            --purge-memory-button \
            --disable-auto-reload \
            --disable-back-forward-cache \
            --disable-bundled-ppapi-flash \
            --disable-databases \
            --disable-device-discovery-notifications \
            --disable-experimental-accessibility-chromevox-language-switching \
            --disable-experimental-accessibility-chromevox-search-menus \
            --disable-flash-3d \
            --disable-flash-stage3d \
            --disable-local-storage \
            --disable-speech-api \
            --disable-speech-synthesis-api  \
            --disable-sync \
            --incognito"

# make sure opera is executable

if [ ! -x "$OPERA" ] ; then
    echo "ERROR: Can't run $OPERA!" >&2
    exit 1;
fi

# if -n is specified, echo the command we would have
# executed and exit

if [ X"$1" = X"-n" ] ; then
    echo $OPERA $OPERA_OPTS
    exit $?
fi

# if -d is specified, don't redirect opera's output
# to /dev/null

if [ X"$1" = X"-d" ] ; then
    exec "$OPERA" $OPERA_OPTS 
else
    exec "$OPERA" $OPERA_OPTS > /dev/null 2>&1
fi

exit $?
