#!/bin/bash
sudo apt -y install build-essential
sudo apt -y install curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
