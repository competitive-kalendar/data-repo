#!/bin/bash

function update_db()
{
path=/update_log
echo -e "\n\n"  >> $path

date >> $path

echo -e "AWS\n" >> $path

curl -X POST "http://$IP_backend/update?platform=all">> $path

}



function update_repo()
{

git pull

platforms=("codechef" "codeforces" "hackerearth" "hackerrank")
phases=("upcoming" "running" "ended")
curl "http://$IP/contests" > contests
curl "http://$IP/contests?phase=upcoming" > upcoming
curl "http://$IP/contests?phase=ended" > ended
curl "http://$IP/contests?phase=running" > running
for i in {0..3}
do
curl "http://$IP/contests?platform=${platforms[$i]}" > ${platforms[$i]}/contests
for j in {0..2}
do
curl "http://$IP/contests?platform=${platforms[$i]}&phase=${phases[$j]}" > ${platforms[$i]}/${phases[$j]}
done
done

git add .
git commit -m "updated"
git push

}


update_db
update_repo
