#!/bin/sh
#
# script to start opera on MacOSX in incognito mode 
# and with some privacy options enabled
# see: https://peter.sh/experiments/chromium-command-line-switches/

OPERA="/Applications/Opera.app/Contents/MacOS/Opera"
OPERA_OPTS="--incognito"
OPERA_EXTRA_OPTS="--disable-plugins-discovery \
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
                  --disable-sync"

# make sure opera is executable

if [ ! -x "$OPERA" ] ; then
    echo "ERROR: Can't run $OPERA!" >&2
    exit 1;
fi

ECHO="";
QUIET="TRUE";
export ECHO QUIET

for ARG in $@
do

    # if -a is specified, add the extra options
    
    if [ X"$ARG" = X"-a" ] ; then
        OPERA_OPTS="$OPERA_OPTS $OPERA_EXTRA_OPTS";
        continue;
    fi

    # if -n is specified, then only echo the command that
    # would be executed, but don't execute the command
    
    if [ X"$ARG" = X"-n" ] ; then
        ECHO=TRUE;
        continue;
    fi

    # if -d is specified, don't redirect opera's output
    # to /dev/null
    
    if [ X"$ARG" = X"-d" ] ; then
        QUIET="";
        continue;
    fi
done

if [ X"$ECHO" = X"TRUE" ] ; then
    echo "$OPERA" $OPERA_OPTS;
    exit $?;
fi

# run opera as requested 

if [ X"$QUIET" = X"TRUE" ] ; then
    exec "$OPERA" $OPERA_OPTS > /dev/null 2>&1
else
    exec "$OPERA" $OPERA_OPTS 
fi

exit $?
