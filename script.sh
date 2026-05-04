#!/bin/bash

START="2026-03-01"
END="2026-05-04"

current=$START
while [ "$(date -d "$current" +%Y-%m-%d)" != "$(date -d "$END +1 day" +%Y-%m-%d)" ]; do
  DATE=$(date -d "$current" +"%Y-%m-%dT06:00:32")

  # SINGLE COMMIT PER DAY
  echo "Commit for $DATE" > progress.log
  git add progress.log
  GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" git commit -m "Daily commit on $DATE"

  # Next day
  current=$(date -d "$current +1 day" +%Y-%m-%d)
done

git push
