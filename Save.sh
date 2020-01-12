source color.sh

TMP="/tmp"
temp="/Users/lachille/Autosave/tmp/"

clear
if [ "$1" = "-re" ]
then
	{
		echo yolololoololo${red}
		rm -rf ${TMP}/save
		echo ${nul}
	}
fi

echo Test si fichier ${blu}$TMP/save${nul} existe
if [ ! -d "${TMP}/save" ]
then
	{
		echo ${green}creation du repertoire...${nul}
		cd ${TMP}
		sleep 2
		git clone https://gitlab.com/lachille/save.git
		#git init
		#cd .git
		#echo "[remote "origin"]
	#url = https://github.com/leachille/save.git
	#fetch = +refs/heads/*:refs/remotes/origin/*
#[branch "master"]
#	remote = origin
#	merge = refs/heads/master" >> config
##		cd ..
		pwd
	}
fi

cd
ls -l ~ | grep -v "total" | grep -v "Applications" | grep -v "Library" | grep -v "Desktop" | grep -v "Movie" | grep -v "Picture" | grep -v "Library" |grep -v "Music" | grep -v "Documents" | grep -v "Downloads" | grep -v "/Volumes/Storage/goinfre/lachille/" | rev | cut -f1 -d " " | rev > ${temp}DirToCpy.txt
cd $TMP/save
ls -l ${TMP}/save | grep -v "total" | grep -v "Applications" | grep -v "Library" | grep -v "Desktop" | grep -v "Movie" | grep -v "Picture" | grep -v "Library" |grep -v "Music" | grep -v "Documents" | grep -v "Downloads" | grep -v "/Volumes/Storage/goinfre/lachille/" | rev | cut -f1 -d " " | rev > ${temp}DirToCpy2.txt
test=0

echo ${vio_}Debut de la copie...${nul}
for i in $(cat ${temp}DirToCpy.txt)
do

	{
		echo "${clean} Copy of :"
		echo "${up}${yel}		$i${nul}"
		#cp -R -p $i ${TMP}/save > /dev/null 2> /dev/null
		rsync -aq ~/$i ${TMP}/save > /dev/null 2> /dev/null
		echo "${up}${green}		$i${nul}"
	}
done

for j in $(cat ${temp}DirToCpy2.txt)
do
	{
	if [ ! "$(grep $j ${temp}DirToCpy.txt)" = "$j" ]
	then
		{
			git rm -rf ${TMP}/save/$j
		}
	fi
	}
done

echo ${up}${clean}${green} DONE${nul}
echo ${vio_}Envoi dans la Backup...${nul}
cd ${TMP}/save
git add .
change=$(git status | grep -v "content" | grep -v "committed" | grep -v "commit" | grep ":")
#nb_line=$(wc -l ${temp}DirToCpy.txt | cut -f1 -d "f" | rev | cut -f2 -d " " | rev)
#w#hile true; do
#	nom_c=$(sed -n "${nb_line} p" ${temp}DirToCpy.txt)
#	echo "${up}${clean} Copy of :"
#	echo "${up}${yel}				${nom_c}${nul}"
#	$(cp -R ${nom_c} ${TMP} > /dev/null) 2> /dev/null
#	echo ${green}DONE${nul}
#	if [ $nb_line = 1 ]
#	then
#		break
#	fi
#	((nb_line--))
#done
day=$(date -R | cut -f2 -d " ")
month=$(date -R | cut -f3 -d " ")
year=$(date -R | cut -f4 -d " ")
time=$(date -R | cut -f5 -d " " | cut -b 1-5)
echo ${yel}
git commit -m "${day}/${month}/${year} at : ${time}
$change" 2> /dev/null
echo ${nul}
git push
echo ${green}Sauvegarde termine${nul}
sleep 2
exit
