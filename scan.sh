let "expire = ( $(date +"%s") - $(date -r cache.scan +"%s") )"

date +"%S"

if [ $expire -gt 10 ]
then
 echo "cache expired"
 > cache.scan
 net="10.7.180."
 for i in {110..120}
 do
 	ip="$net$i"
 	ping -c1 $ip &>>/dev/null && echo "$ip +" || echo "$ip -"
 done >> cache.scan
else
 echo "cache fresh"
fi

cat cache.scan
