#!/bin/bash
#!/bin/sh
clear
sleep 1
b='\033[34;1m' #blue
g='\033[32;1m' #g3en
p='\033[35;1m' #purple
c='\033[36;1m' #cyan
r='\033[31;1m' #red
w='\033[37;1m' #white
y='\033[33;1m' #yellow
o='\033[1;38;5;208m' #Orange
printf $r
echo
echo """     ___                            __  ___"""
echo """    /   |  ____  ____  ____  __  __/  |/  /_  ___  __"""
echo """   / /| | / __ \/ __ \/ __ \/ / / / /|_/ / / / / |/_/"""
echo """  / ___ |/ / / / /_/ / / / / /_/ / /  / / /_/ />  <"""
echo """ /_/  |_/_/ /_/\____/_/ /_/\__, /_/  /_/\__,_/_/|_|"""
echo """                          /____/ Coded by Mr.p1r4t3"""
echo
echo $r" ["$g"*"$r"]"$r" Installing required packages"$g"..."
sleep 4
echo
touch $HOME/.bash_profile
pkg install termux-services tor torsocks proxychains-ng -y
echo $g" ["$r"*"$g"]"$c" Setting up tor"$g"..."
sleep 2
export SVDIR=$HOME/.sv
sv-enable tor
echo
echo $g" ["$r"*"$g"]"$c" Configuring Proxychains"$g"..."
echo
sleep 3
mv config.conf proxychains.conf
rm $PREFIX/etc/proxychains.conf
mv proxychains.conf $PREFIX/etc/
echo $g" ["$r"*"$g"]"$c" Setting up commands"$g"..."
echo
mkdir $PREFIX/share/AnonyMux
mv torstart $PREFIX/share/AnonyMux/
mv torstop $PREFIX/share/AnonyMux/
echo "#!/bin/bash
sh $PREFIX/share/AnonyMux/torstart" > anonstart
echo "#!/bin/bash
sh $PREFIX/share/AnoyMux/torstop" > anonstop
mv anonstop $PREFIX/bin/
mv anonstart $PREFIX/bin/
chmod +x $PREFIX/bin/anonstart
chmod +x $PREFIX/bin/anonstop
echo $g" [✓] "$r"Anonymux "$g"successfully installed."
echo
echo " anonstart to start"
echo " anonstop to stop"
echo
echo " After running it type curl ifconfig.me"
echo " to check if the ip is changed"
echo
echo " Tips: if you gain reverse shell use space"
echo " to make the command not to logged in .bash_history "
echo " Ex:'$'  echo hello"
echo
