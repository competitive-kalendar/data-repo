#!/bin/bash
git pull

ip="18.117.101.101"
platforms=("codechef" "codeforces" "hackerearth" "hackerrank")
phases=("upcoming" "running" "ended")
curl "http://$ip/api/contests" > contests
curl "http://$ip/api/contests?phase=upcoming" > upcoming
curl "http://$ip/api/contests?phase=ended" > ended
curl "http://$ip/api/contests?phase=running" > running
for i in {0..3}
do
curl "http://$ip/api/contests?platform=${platforms[$i]}" > ${platforms[$i]}/contests
for j in {0..2}
do
curl "http://$ip/api/contests?platform=${platforms[$i]}&phase=${phases[$j]}" > ${platforms[$i]}/${phases[$j]}
done
done


git add .
git commit -m "updated"
git push

