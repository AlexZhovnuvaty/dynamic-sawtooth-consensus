sawset proposal create \
            --url http://rest-api-0:8008 \
            -k /pbft-shared/validators/validator-0.priv \
            sawtooth.consensus.algorithm.name=poet \
            sawtooth.consensus.algorithm.version=0.1 \
            sawtooth.poet.report_public_key_pem="$(cat /pbft-shared/simulator_rk_pub.pem)" \
            sawtooth.poet.valid_enclave_measurements="$(cat /pbft-shared/poet-enclave-measurement)" \
            sawtooth.poet.valid_enclave_basenames="$(cat /pbft-shared/poet-enclave-basename)" \
            sawtooth.poet.target_wait_time=5 \
            sawtooth.poet.initial_wait_time=25 #\
#            sawtooth.publisher.max_batches_per_block=100 \
#            -o poet_config.batch