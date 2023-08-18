#!/bin/bash
uuiddir=$(uuidgen)
mkdir $uuiddir
cd $uuiddir
git init

limit_date="2022-8-15"
n=1
limit_date=$(date +%Y-%m-%d -d "$limit_date + $n days")
echo $limit_date # 2018-01-14

uuidfile=$(uuidgen)

k=0
while [ $k -lt 360 ]
do
echo "$k">$uuidfile
git add .
git commit -m $(uuidgen)
git commit --amend --no-edit --date="$limit_date 12:00"
k=$(( $k + 1 ))
limit_date=$(date +%Y-%m-%d -d "$limit_date + $n days")
done

echo "$uuiddir"
