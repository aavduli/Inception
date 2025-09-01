Change username on my VM: 

su - #to be on root
usermod -l aavduli boss #new name and old name

mv /home/boss /home/aavduli #moves files from boss to aavduli
usermod -d /home/aavduli -m aavduli #update home path.

groupmod -n aavduli boss #update grp name

then exit

to copy files :
scp -P 2222 ~/Documents/Inception aavduli@<VP_IP>:/home/aavduli


connect to mysql: 

docker exec -it mariadb mysql -u root -p
