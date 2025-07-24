#!/bin/bash

MAILDIR="$1"
QUARANTINE="/tmp/quarantine"
mkdir $QUARANTINE
MAX_UID=123

if [[ -z "$MAILDIR" ]]; then
  echo "Usage: $0 /path/to/Maildir/[folder]"
  exit 1
fi

mkdir -p "$QUARANTINE"
cd "$MAILDIR/cur" || { echo "Error: folder not found."; exit 1; }

echo "🔍 Collecting used UIDs..."

# List used UIDs ≤ 123
used=($(find . -type f -name '*U=*' \
  | sed -n 's/.*U=\([0-9]\+\):.*/\1/p' \
  | awk -v max=$MAX_UID '$1 <= max' \
  | sort -n | uniq))

# Determine available UIDs
available=()
for i in $(seq 1 $MAX_UID); do
  if ! [[ " ${used[*]} " =~ " $i " ]]; then
    available+=($i)
  fi
done

echo "✅ Found ${#available[@]} available UIDs ≤ $MAX_UID"

COUNT_RENAMED=0
COUNT_QUARANTINED=0

# Fix all files with UIDs > MAX_UID
for file in *U=*; do
  [[ -f "$file" ]] || continue
  uid=$(echo "$file" | sed -n 's/.*U=\([0-9]\+\):.*/\1/p')
  if [[ "$uid" -gt $MAX_UID ]]; then
    if [[ ${#available[@]} -eq 0 ]]; then
      echo "⚠️ No more available UIDs ≤ $MAX_UID, quarantining: $file"
      mv "$file" "$QUARANTINE/"
      ((COUNT_QUARANTINED++))
      continue
    fi
    new_uid=${available[0]}
    unset 'available[0]'
    available=("${available[@]}") # reindex array
    new_file="${file/U=$uid/U=$new_uid}"
    mv "$file" "$new_file"
    echo "🔧 Renamed $file → $new_file"
    ((COUNT_RENAMED++))
  fi
done

echo "✅ $COUNT_RENAMED files renamed"
echo "🧩 $COUNT_QUARANTINED files moved to: $QUARANTINE"

