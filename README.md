# Personal_Scripts_All_in_One
This is a Collection of scripts that I have written for my linux Workstation.

Some of these scripts are quite small as some commands can be difficult to remember.

Since there is alot of scripts I will provide a brief explaination for each one going in the order visible on github so the folders will be first.

## i3_crap
These scripts are related to the i3 window manager. They either help with startup or keyboard shortcuts.
##### i3_start_up.sh
is the main one here and this runs when I login. This script mounts all the hard drives, mounts the nas drives, startsup some applications, vpn etc..
##### terminal_launcher.sh
launches neofetch if specified, used primarily for my i3 config thats why it looks kinda strange.
##### compositor_toggle.sh
toggles picom compositor by killing it if it is in the process list or starting it if not.
##### border_notify.sh
This script I wrote when I was new to i3 and kept loosing the current window lol. After using i3wm for a year or so you learn to tell which window is active quite easily.

## jack
These scripts mess around with the jack config. Jack is a realtime audio API for linux, it is an alternative for pulseaudio.
##### jack-pre-stop jack-post-start
These are startup scripts used in jackctl
##### obs_connect.sh
this connects jack inputs for obs to the my mixer.
##### mplayer_remove.sh
this removes connections that mplayer makes by default to jack and connects them to correct inputs.

## polybar
polybar is a common status bar used with window managers. Here are some scripts I wrote that get called from the config
##### disk_usage.sh
This literly shows how much free space is available on each of my drives both internal and network. It outputs something like this.
```
root:121G|tmp:16G|temp:159G|veracrypt1:966G|1tb-ssd:179G|2tbssd:1.4T|5tbhdd:798G|Nmusic:523G|Ngames:59G|Nmovies:219G|N8tbhdd:3.1T|Ndump:392G
```
##### music.sh
This outputs the current song playing if there is any and its nicely formatted.

## terminal_heat_sink
For now this only has the intro script that I use as for my youtube channel. It just draws some fancy heat sink and plays music.

## android_screen_view.sh
This lets you stream your android screen to the pc without any bs.

## cpu-fast cpu-slow
These change the cpu governor and clocks. slow I use when my laptop is disconnected from the wall.

## display-terminal-colours.sh
Lists all the available colours in the terminal. Handy for making shell themes.

## dl-vid.sh
My interactive wrapper for youtube-dl it has all my favourite options so I don't need to remember anything 

## dns.sh
Changes dns

## find_mouse.sh
Again this is when I was getting used to i3wm. after launching this script though a keyboard shortcut the mouse would move to the centre of my main screen.

## firefox_tabs.sh
Allows you to save your curently open tabs. This script generated another scripts that can be launched to open the saved tabs.

## git-repo-size.sh
Allows you to see the repo size before cloning. Handy if you have low disk space.

## lancache.sh
Changes my dns to my lancache server

## lockscreen.sh
takes a picture of your desktop, blurs it and applies some effects, then uses i3lock to lock and set that picture as the lockscreen.

## monitor_temp.sh
monitors tempetures and other stats.

## mount_nfs.sh
used to mount/unmount nas storage

## move_files_from_folders.sh
moves all the files from the current folders into the current folder.

## mp3.sh
uses youtube-dl to download best quality mp3 and thumbnails.

## play_mouse.sh
moves the mouse all over the screen

## ranger-music.sh
sets options for ranger to use smplayer

## ranger_shell.sh
sets options for ranger again such as corrent alias file and so on.

## rm_empty_dir.sh
deletes empty directories in the current directory, mostly used after move_files_from_folders.sh

## rm_everything_except.sh
deletes everything in the current directory except the file types you specify. eg. txt will remove everything thats not a txt.

## rotate-img.sh
rotates an image

## rotateScreen.sh
rotates the display

## screen_organise.sh
uses xrandr to reposition displays, used in i3_startup script.

## screenshot.sh
takes a screenshot and saves it into /tmp

## season_renamer.sh 
renames seasons into a more sane name.

## shell_randomiser.sh
randomises shell colours and draws background and other random things. works best with kitty.

## sound_increase.sh
controll sound used with i3 keybindings.

## telegram_typer.sh
can contents of files and anything else into telegram or other windows.

## timer.sh
a timer that plays timer.sh when done. it uses the following format timer 10m for 10 minutes, etc.

## tmp_upload.sh
uses the temporary file upload service.

## update_mirrors.sh
updates pacman mirrors.

## wav.sh
samething as mp3.sh but for wav files as adobe hates mp3s.








