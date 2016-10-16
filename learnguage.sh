#!/bin/zsh
#Sun Oct 16 19:29:58 CEST 2016i
#magicminski
file=translations
( [ -e "$file" ] || touch "$file" ) && [ ! -w "$file" ] && echo cannot write to $file && exit 1
while true;do
  copy=$(echo `xclip -selection primary -o`)
    while true; do
      copycopy=$(echo `xclip -selection primary -o`) 
        if [ $copy != $copycopy ]; then
          word=$(gawk -f <(curl -Ls git.io/translate) -show-original n -show-original-phonetics n -show-prompt-message n -show-languages n -show-alternatives n -show-dictionary n -no-ansi en:de `xclip -selection primary -o`)
notify-send "$copycopy | $word" #under OSX replace this line with: "growlnotify -m "$copycopy | $word" -n "EasyReading"
echo "$copycopy|$word"  >> translations
            break 1 
        fi
    ;done
;done
