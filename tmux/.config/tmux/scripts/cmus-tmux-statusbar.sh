#!/bin/bash

if [[ $1 =~ ^[[:digit:]]+$ ]]; then
  MAX_TITLE_WIDTH=$1
else
  MAX_TITLE_WIDTH=70
fi

if command -v cmus-remote > /dev/null 2>&1; then
  STATUS=$(cmus-remote -C status | sed -n 1p | cut -d " " -f2)

  OUTPUT=$(cmus-remote -C "format_print %{title}\ -\ %{artist}")

  if [ -n "$OUTPUT" ]; then
    if [ "${#OUTPUT}" -ge $MAX_TITLE_WIDTH ]; then
      OUTPUT="${OUTPUT:0:$MAX_TITLE_WIDTH-3}..."
    fi

    if [ "$STATUS" = "playing" ]; then
      OUTPUT="[▶ $OUTPUT]"
    else
      OUTPUT="[❚❚ $OUTPUT]"
    fi
  else
    OUTPUT=""
  fi
fi

echo "$OUTPUT"
