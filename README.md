# dynamic-sawtooth-consensus
Dynamic Hyperledger Sawtooth that is able to change consensus dynamically through a code, Sawtooth has two consensus protocols, including PoET and PBFT. 

##### How it works?

4 sawtooth nodes started and joined into one network. PBFT consensus is set by default. The repo includes 2 shell scripts which sets PBFT and PoET consensus accordingly.

##### How to test?

- Start the infrastructure up (4 blockchain nodes up and running):

`docker-compose -f docker-compose-4-nodes-dynamic-consensus up -d`

- Check the current consensus is set to PBFT:

`root@d7d546c1e73f:/project/dynamic-consensus# sawtooth settings list --url http://rest-api-0:8008`

`... 
sawtooth.consensus.algorithm.name: pbft
...`

- Connect to the shell docker container:

`$ docker exec -it sawtooth-shell-default /bin/bash`

`root@d7d546c1e73f:/#`

- Add first item to the blockchain:

`root@d7d546c1e73f:/# xo create pbft1 --url http://rest-api-0:8008`

`root@d7d546c1e73f:/# xo list --url http://rest-api-0:8008`

`GAME            PLAYER 1        PLAYER 2        BOARD     STATE`

`pbft1                                           --------- P1-NEXT`

- Change active consensus to PoET:

`root@d7d546c1e73f:/# cd project/dynamic-consensus/`

`root@d7d546c1e73f:/project/dynamic-consensus# sh set_poet_consensus.sh`

`root@d7d546c1e73f:/project/dynamic-consensus# sawtooth settings list --url http://rest-api-0:8008`

`... 
sawtooth.consensus.algorithm.name: poet
...`

- Add second item to the blockchain:

`root@d7d546c1e73f:/project/dynamic-consensus# xo create poet2 --url http://rest-api-0:8008`

`root@d7d546c1e73f:/project/dynamic-consensus# xo list --url http://rest-api-0:8008`

`GAME            PLAYER 1        PLAYER 2        BOARD     STATE`

`pbft1                                           --------- P1-NEXT`

`poet2                                           --------- P1-NEXT`

- Change active consensus to PBFT again:

`root@d7d546c1e73f:/project/dynamic-consensus# sh set_pbft_consensus.sh`

`root@d7d546c1e73f:/project/dynamic-consensus# sawtooth settings list --url http://rest-api-0:8008`

`... sawtooth.consensus.algorithm.name: pbft ...`
`
- Add third item to the blockchain:

`root@d7d546c1e73f:/project/dynamic-consensus# xo create pbft3 --url http://rest-api-0:8008`

`root@d7d546c1e73f:/project/dynamic-consensus# xo list --url http://rest-api-0:8008`

`GAME            PLAYER 1        PLAYER 2        BOARD     STATE`

`pbft3                                           --------- P1-NEXT`

`pbft1                                           --------- P1-NEXT`

`poet2                                           --------- P1-NEXT`
