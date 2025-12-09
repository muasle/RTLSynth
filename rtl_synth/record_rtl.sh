#!/bin/bash

OUTDIR="/home/user/Documents/Pd/rtl_synth/recordings"
mkdir -p "$OUTDIR"

if [ -z "$1" ]; then
	echo "Error: Must provide filename"
	exit 1
fi

FREQ="103.1M"
DURATION=3

OUTFILE="$OUTDIR/$1.wav"

echo "Recording audio ..."
echo "Saving to $OUTFILE ..."

rtl_fm -f "$FREQ" -M wbfm -s 200000 -r 48000 -g 40 - | \
	sox -t raw -r 48k -e signed -b 16 -c 1 - -t wav "$OUTFILE" trim 0 "$DURATION"

echo "Complete!"
