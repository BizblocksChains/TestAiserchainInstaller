## Aiserchain Testnode Installer

# docker install
> curl -fsSL https://get.docker.com/ | sudo sh

> sudo usermod -aG docker $USER 

=> reconnect terminal

# git clone installer
> git clone https://github.com/BizblocksChains/TestAiserchainInstaller.git 

> cd TestAiserchainInstaller

> must be open ports : 23000 - 23005,  

> ./setup.sh join -n name --oip masternode --onm masternode_nodemanager_port --tip myip -r 23000 -w 23001 -c 23002 --raft 23003 --nm 23004 --ws 23005 -d

ex) ./setup.sh join -n subnode1 --oip testnet.bizblocks.io --onm 22004 --tip 59.27.21.157 -r 23000 -w 23001 -c 23002 --raft 23003 --nm 23004 --ws 23005 -d

==>  After installation, the following message appears." Waiting for approval..., Join Request sent to testnet.bizblocks.io. Waiting for approval..."

==> If the installation is successful
Successfully created and started slave10
You can send transactions to 1.1.1.1:24000
For private transactions, use hJznIbjWTr4IFZ9gYM7HcKecP47HJWCtK48cyDJXkBk=
For accessing Quorum Maker UI, please open the following from a web browser http://localhost:24004/
To join this node from a different host, please run Quorum Maker and choose option to run Join Network
When asked, enter 1.1.1.1 for Existing Node IP and 24004 for Node Manager port

# nodemanager address
> http://yourip:23004

## aiserchain blockchain address
> rpc : testnet.bizblocks.io:22000, token address : 0x345ca3e014aaf5dca488057592ee47305d9b3e10
