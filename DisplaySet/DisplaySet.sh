#!/bin/bash

# DisplaySet.sh - Script to handle 3-digit arguments
# Usage: ./DisplaySet.sh <3-digit-number>

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 [CONFIG-STRING]"
    echo "Description: Set Displays for a 3 screen setup "
    echo "Config Strings:"
    echo "123:  3 displays, all on"
    echo "012:  2 displays on "
    echo "112:  3 displays on, Duplicate first two"    
    exit 1
fi

# Store the argument
ARG=$1

# Validate that the argument is a 3-digit number
if ! [[ "$ARG" =~ ^[0-9]{3}$ ]]; then
    echo "Error: Argument must be exactly 3 digits (000-999)"
    echo "Usage: $0 <3-digit-number>"
    exit 1
fi

# Switch/case structure to handle different cases
case $ARG in
    123)
        echo "xrandr 123";
        xrandr \
        --output DP-5 --mode 1920x1080 --pos 0x616 \
        --output DP-2.8 --mode 1920x1080 --pos 1920x616 \
        --output DP-1 --mode 1920x1080  --rotate right --pos 3840x0; \
        sleep 10
        #All 3 monitors on, set up with proper vertical alignment (616 pixel offset)
        ;;
    012)
        echo "xrandr 012";
        xrandr \
        --output DP-5 --off \
        --output DP-2.8 --mode 1920x1080 --pos 0x616 \
        --output DP-1 --mode 1920x1080  --rotate right --pos 1920x0; \
        sleep 10
        #Middle and Right monitors on, set up with proper vertical alignment (616 pixel offset)
        ;;
    010)
        echo "xrandr 010";
        xrandr \
        --output DP-5 --off \
        --output DP-2.8 --mode 1920x1080 --pos 0x0 \
        --output DP-1 --off;
        sleep 10;
        #Only Middle Monitor, suitable for remote work
        ;;
    001)
        echo "xrandr 001";
        xrandr \
        --output DP-5 --off \
        --output DP-2.8 --off\
        --output DP-1 --mode 1920x1080  --rotate right --pos 1920x0; \
        sleep 10;
        #Only Right Monitor portrait
        ;;
    902)
        echo "xrandr 902";
        echo "Unmapped"
        ;;        
    *)
        echo "Invalid setting: $ARG"
        # Add your default logic here
        ;;
esac

#echo "Script completed successfully."
exit 0