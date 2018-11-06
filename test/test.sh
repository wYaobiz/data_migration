#!/bin/env zsh
zmodload zsh/mathfunc

echo "Bracket Disks ID Random_Rounds D' Time" >> random_reg_even.txt
echo "Bracket Disks ID EdgeRanking_Rounds D' Time" >> edgerank_reg_even.txt
echo "Bracket Disks ID FlattenAndColor_Rounds D' Time" >> flattencolor_reg_even.txt
echo "Bracket Disks ID Greedy_Rounds D' Time" >> greedy_reg_even.txt

for n in 10 50 100 500 1000
do
    for z in {1..10}
    do
        echo "Testing $n disks. Iteration $z of 10"
	offset=$((int($n+$RANDOM%($n*0.1))))
        # Test random w/ fresh graph
	echo " -> RANDOM"
	start=$SECONDS
        random_r=$(python3 ../simulator.py inorder --random $offset --even_cv 6 | tail -1)
	finish=$SECONDS
        random_t=$(($finish-$start))
	echo "$n $offset $random_r $random_t" >> random_reg_even.txt
        # Test greedy using rand graph
	echo " -> EDGE RANKING"
	start=$SECONDS
        edge_r=$(python3 ../simulator.py edge_ranking --file network.gpickle | tail -1)
	finish=$SECONDS
        edge_t=$(($finish-$start))
        echo "$n $offset $edge_r $edge_t" >> edgerank_reg_even.txt
        # Test color using rand graph
	echo " -> FLATTEN AND COLOR"
	start=$SECONDS
        flat_r=$(python3 ../simulator.py flatten_and_color --file network.gpickle | tail -1)
	finish=$SECONDS
        flat_t=$(($finish-$start))
        echo "$n $offset $flat_r $flat_t" >> flattencolor_reg_even.txt

        echo " -> GREEDY"
	start=$SECONDS
        greedy_r=$(python3 ../simulator.py greedy --file network.gpickle | tail -1)
	finish=$SECONDS
        greedy_t=$(($finish-$start))
        echo "$n $offset $greedy_r $greedy_t" >> greedy_reg_even.txt
    done
done
