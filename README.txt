opera.sh
--------

opera.sh is a script to start Opera in private browsing / incognito
mode on MacOSX.  It is based on:

   https://peter.sh/experiments/chromium-command-line-switches/

opera.sh expects Opera.app to be located in /Applications.  If 
Opera.app is installed in a different location, the variable
OPERA on line 7 of opera.sh will need to be changed accordingly.

Homepage:

   https://github.com/srirangav/opera.sh

Install:

    Put opera.sh in a directory in your $PATH, e.g.:

    $ cp opera.sh $HOME/bin
    $ chmod u+x $HOME/bin/opera.sh

Running opera.sh:

    $ opera.sh [-n|-d]

    -n  prints out the command that would have been run
        but does not run Opera

    -d  enables Opera error messages

History:

    v.0.1.0  Initial release

License:

    See LICENSE.txt

Notes:

    Some suggested addons for Opera are:
    
    1. Adblocker for Youtube:
    
        https://mybrowseraddon.com/adblocker-for-youtube.html
        
    2. Disconnect:
    
        https://disconnect.me/disconnect/help
        
    3. Ghostery
    
    4. HTTPS Everywhere:
    
        https://www.eff.org/https-everywhere
        
    5. Install Chrome Extensions
    
    6. KeePassXC-Browser
    
    7. Privacy Badger
    
    8. SimpleClear
    
    9. uBlock Origin
