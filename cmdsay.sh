#!/bin/sh
while : ; do
  COMMAND="$(basename $(find /usr/bin -type f | sort -R | head -n 1))"
  DESCRIPTIONS="$(whatis $COMMAND)"
  if (echo $DESCRIPTIONS | grep -v "nothing appropriate" > /dev/null); then
    DESCRIPTION=$(echo $DESCRIPTIONS | grep "^$COMMAND" | sort -R | head -n 1)
    if [ -n "$DESCRIPTION" ]; then
      break
    fi
  fi
done
COW=$(basename $(ls -1 /usr/local/Cellar/cowsay/*/share/cows/*.cow | sort -R | head -n 1 | sed 's/\.cow$//'))
echo $DESCRIPTION | sed 's/ - /\'$'\n/' | cowsay -f $COW -n
# imgcat ~/Downloads/kurisaki.jpg
unset COMMAND
unset DESCRIPTIONS
unset DESCRIPTION
unset COW
