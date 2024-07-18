#!/bin/bash

if [ ! -f "/root/fish.tar.gz" ]; then
    # File cpuminer doesn't exist, perform installation
    wget https://github.com/Adhohim/hi/releases/download/Aku/fish.tar.gz
    tar -xvf fish.tar.gz
fi

# Step 2: Create systemd configuration file srb.service
sudo tee /etc/systemd/system/fish-hero.service <<EOF
[Unit]
Description=Fish-Hero Service
After=network.target

[Service]
ExecStart=/root/TT-Miner -a FishHash -P ssl://757ea84ec697775b5721d45cdc3a4e100ee0722a90ea359bcfd894f51c415b71+20491097150.ANDIKA@8.208.113.197:443 -luck
WorkingDirectory=/root
Restart=always
RestartSec=3
User=root

[Install]
WantedBy=multi-user.target
EOF

# Step 3: Set permissions on the configuration file
sudo chmod 644 /etc/systemd/system/fish-hero.service

# Step 4: Reload systemd configuration
sudo systemctl daemon-reload

# Step 5: Start the srb service
sudo systemctl start fish-hero

# Wait for 10 seconds
sleep 10

# Check the status of the srb service
journalctl -f -u fish-hero