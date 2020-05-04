sawset proposal create \
            --url http://rest-api-0:8008 \
            -k /pbft-shared/validators/validator-0.priv \
            sawtooth.consensus.algorithm.name=pbft \
            sawtooth.consensus.algorithm.version=1.0 #\
#            sawtooth.consensus.pbft.members=\\['\"'$(cat /pbft-shared/validators/validator-0.pub)'\"','\"'$(cat /pbft-shared/validators/validator-1.pub)'\"','\"'$(cat /pbft-shared/validators/validator-2.pub)'\"','\"'$(cat /pbft-shared/validators/validator-3.pub)'\"']\\ \
#            sawtooth.publisher.max_batches_per_block=1200 \
#            -o pbft_config.batch