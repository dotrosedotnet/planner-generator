#!/usr/bin/env bash

start_date="2026-01-01"
end_date="2026-07-01"

generated_date="$start_date"
while [[ "$generated_date" != "$end_date" ]]; do
  echo "$generated_date"
  generated_date=$(date --date="$generated_date + 1 day" +%Y-%m-%d)
done
