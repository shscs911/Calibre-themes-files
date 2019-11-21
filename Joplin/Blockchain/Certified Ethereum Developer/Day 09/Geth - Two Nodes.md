Geth - Two Nodes

Node 1

Terminal 1:

sudo service network-manager restart
nmcli device wifi hotspot con-name my-hotspot ssid my-hotspot band bg password 123456789

bootnode -genkey boot.key
bootnode -nodekey boot.key -verbosity 9 -addr :30310


Didnt got the boot node 

^c

bootnode -nodekeyhex [Your node key] -writeaddress

bootnode -nodekeyhex f367ef2ee791e340529d19ec4bc7411e3baa8a928f22304e9e88a989d63c8f13 -writeaddress


Terminal 2:

geth --datadir node account new
geth --datadir node init genesis.json


geth --datadir node1/ --syncmode 'full' --port 30311 --rpc --rpcaddr 'localhost' --rpcport 8545 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes 'enode://e5f7dbf4757715f1ec3a1b35412fdaa41971e8cb114a177a46e3a3613ba8a4c5d1bbeb791b5548a36cbc498237f92433d47000b3fd47659a7c6b26eb00eecc64@10.42.0.1:30310' --ipcpath '~/.ethereum/geth.ipc' --rpccorsdomain '*' --networkid 4002 -unlock 0 --gasprice '1' console




Node 2

Terminal 1:
geth --datadir node account new
geth --datadir node init genesis.json


geth --datadir node/ --syncmode 'full' --port 30312 --rpc --rpcaddr 'localhost' --rpcport 8502 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes 'enode://e5f7dbf4757715f1ec3a1b35412fdaa41971e8cb114a177a46e3a3613ba8a4c5d1bbeb791b5548a36cbc498237f92433d47000b3fd47659a7c6b26eb00eecc64@10.42.0.1:30310' --ipcpath '~/.ethereum/geth.ipc' --rpccorsdomain '*' --networkid 4002 --gasprice '1' -unlock 0




Rinkeby:

geth --rinkeby --syncmode light --datadir "rin" --unlock 0 --rpc --rpcapi "db,eth,net,web3,personal" --cache=1024 --rpcport 8545 --rpcaddr 127.0.0.1 --rpccorsdomain "*" --ipcpath '~/.ethereum/geth.ipc'