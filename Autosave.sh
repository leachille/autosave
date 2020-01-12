source color.sh

t_refresh=1
t_loop=900
i=0
t_left_min=($t_loop-$i)/60
t_left_s=($t_loop-$i)%60

sh Save.sh
echo " "
echo "${clean}"
if [ ! -f barre ]
then
	{
		gcc barre_pourcent.c -o barre
	}
fi
while true
do
	{
		clear
		((t_left_min=($t_loop-$i)/60))
		((t_left_s=($t_loop-$i)%60))
		pourcent=$(echo "($i/$t_loop)*100" | bc -l)
		if [ $i = $t_loop ]
		then
			{
				((i = 0))
				sh Save.sh > tmp/save.txt
				cat tmp/save.txt
				sleep 4
				echo " "
				echo " "
			}
		fi
		echo "${up}${clean}${up}${clean}Temps avant prochaine Sauvegarde : ${t_left_min} min  ${t_left_s} sec"
		./barre $pourcent
		sleep $t_refresh
		((i += t_refresh))
	}
done
