#!/bin/bash

routes=(games games/20150418-NationalsPark-1 pitchers pitchers/519455 pitch-types pitch-types/KN/pitchers pitch-types/CU/pitchers/544931)

for i in ${routes[@]}; do
  printf "Start test ${i}\n" >> response.txt
  curl "http://localhost:3000/${i}" >> response.txt
  printf "\nEnd test ${i}\n" >> response.txt
done

echo "Test output in response.txt"
