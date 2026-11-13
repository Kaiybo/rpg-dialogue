#!/bin/sh
# Links every addon folder in this repo into your WoW AddOns folder (macOS / Linux).
# Usage: tools/link_addons.sh "/Applications/World of Warcraft/_forever_/Interface/AddOns"
# (Check the folder name for Forever on your machine; the beta used _classic_beta_.)
set -e
ADDONS="$1"
if [ -z "$ADDONS" ] || [ ! -d "$ADDONS" ]; then
  echo "Give the path to your Interface/AddOns folder." >&2
  exit 1
fi
REPO="$(cd "$(dirname "$0")/.." && pwd)"
for dir in "$REPO"/RPGDialogue "$REPO"/RPGDialogue_*; do
  [ -d "$dir" ] || continue
  name="$(basename "$dir")"
  if [ -e "$ADDONS/$name" ] && [ ! -L "$ADDONS/$name" ]; then
    echo "Skipping $name: a real folder with that name is already in AddOns." >&2
    continue
  fi
  ln -sfn "$dir" "$ADDONS/$name"
  echo "linked $name"
done
