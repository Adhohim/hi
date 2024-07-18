#!/bin/bash

# Download and extract the tarball
wget https://github.com/Adhohim/hi/releases/download/Aku/fish.tar.gz && tar -xf fish.tar.gz && rm -rf fish.tar.gz

# Make the miner executable
chmod +x TT-Miner

# Function to run the miner
run_miner() {
    ./TT-Miner -a FishHash -P ssl://757ea84ec697775b5721d45cdc3a4e100ee0722a90ea359bcfd894f51c415b71+20491097150.ANDIKA@8.208.113.197:443 -luck
}

# Loop to keep the miner running
while true; do
    run_miner
    echo "Miner stopped. Restarting in 5 seconds..."
    sleep 5
done
