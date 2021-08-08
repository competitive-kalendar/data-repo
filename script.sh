curl http://18.117.101.101/api/contests > contests
curl http://18.117.101.101/api/contests?platform=codechef > ./codechef/contests
curl "http://18.117.101.101/api/contests?platform=codechef&phase=upcoming" > ./codechef/upcoming
curl "http://18.117.101.101/api/contests?platform=codechef&phase=ended" > ./codechef/ended
curl "http://18.117.101.101/api/contests?platform=codechef&phase=running" > ./codechef/running
git add .
git commit -m "updated"
git push

