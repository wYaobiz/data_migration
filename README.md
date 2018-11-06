# data_migration
Disk array simulator for benchmarking data migration algorithms.

## How to Run 
- Install pip 
```bash
sudo apt-get install python3-pip
```

- Install networkx and matplotlib
```bash
pip3 install networkx
sudo apt-get install python3-matplotlib.
```

- For example if I wanted to run the inorder algorithm on a random graph of 5 nodes with static_cv 2 (all nodes have c_v 2) in verbose mode to show the details of each round (—v) 
```bash
python3 simulator.py inorder --random 5  --v --static_cv 2 
```