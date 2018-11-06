# data_migration
Disk array simulator for benchmarking data migration algorithms.

install pip 
sudo apt-get install python3-pip

install networkx and matplotlib
pip3 install networkx
sudo apt-get install python3-matplotlib.

run the code. For example if I wanted to run the inorder algorithm on a random graph of 5 nodes with static_cv 2 (all nodes have c_v 2) in verbose mode to show the details of each round (—v) 
 python3 simulator.py inorder --random 5  --v --static_cv 2 
