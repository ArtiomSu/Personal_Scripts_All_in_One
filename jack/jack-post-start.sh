#!/bin/bash
sudo rm -rf /tmp/pulse* ~/.pulse* ~/.config/pulse
pulseaudio -k
sleep 2
pulseaudio --start
sleep 4

pactl load-module module-jack-sink channels=2
pactl load-module module-jack-source channels=2

pacmd set-default-sink jack_out
pacmd set-default-source jack_in

jack_disconnect "PulseAudio JACK Source:front-left" "system:capture_1"
jack_disconnect "PulseAudio JACK Source:front-right" "system:capture_2"

jack_disconnect "PulseAudio JACK Sink:front-left" "system:playback_1"
jack_disconnect "PulseAudio JACK Sink:front-right" "system:playback_2"
