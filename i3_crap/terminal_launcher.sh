if [ $# -eq 0 ]
then	
zsh
exit 0
fi

eval $@

if [ $1 != "neofetch" ]
then	
echo "\n\tproceess [$@] yoped with exit code $?"
fi	
zsh

