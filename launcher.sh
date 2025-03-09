#!/bin/bash

# Define color codes
Black="\033[1;30m"       # Black
Red="\033[1;31m"         # Red
Green="\033[1;32m"       # Green
Yellow="\033[1;33m"      # Yellow
Blue="\033[1;34m"        # Blue
Purple="\033[1;35m"      # Purple
Cyan="\033[1;36m"        # Cyan
White="\033[1;37m"       # White

# Define Minecraft server directory
MINECRAFT_DIR="$HOME/drmatoi_minecrafthost"

# Variables
MINECRAFT_DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.4/builds/203/downloads/paper-1.21.4-203.jar"

GEYSER_DOWNLOAD_URL="https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot"
FLOODGATE_DOWNLOAD_URL="https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot"
VIA_VERSION_DOWNLOAD_URL="https://hangarcdn.papermc.io/plugins/ViaVersion/ViaVersion/versions/5.2.1/PAPER/ViaVersion-5.2.1.jar"
PLAYITGG_DOWNLOAD_URL="https://github.com/playit-cloud/playit-minecraft-plugin/releases/latest/download/playit-minecraft-plugin.jar"


# Display ASCII art and information
echo -e "$Red
  ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣀⡿⠿⠿⠿⠿⠿⠿⢿⣀⣀⣀⣀⣀⡀⠀⠀
⠀⠀⠀⠀⠀⠀⠸⠿⣇⣀⣀⣀⣀⣀⣀⣸⠿⢿⣿⣿⣿⡇⠀⠀Host a Minecraft Server using Android - With Termux
⠀⠀⠀⠀⠀⠀⠀⠀⠻⠿⠿⠿⠿⠿⣿⣿⣀⡸⠿⢿⣿⡇⠀⠀ github.com/drmatoi/minecraft Version 2.0.0
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⣿⣿⣿⣧⣤⡼⠿⢧⣤⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⣿⣿⣿⣿⠛⢻⣿⡇⠀⢸⣿⡇
⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⣿⣿⣿⣿⠛⠛⠀⢸⣿⡇⠀⢸⣿⡇
⠀⠀⠀⠀⠀⠀⢠⣤⣿⣿⣿⣿⠛⠛⠀⠀⠀⢸⣿⡇⠀⢸⣿⡇
⠀⠀⠀⠀⢰⣶⣾⣿⣿⣿⠛⠛⠀⠀⠀⠀⠀⠈⠛⢳⣶⡞⠛⠁
⠀⠀⢰⣶⣾⣿⣿⣿⡏⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀
⢰⣶⡎⠉⢹⣿⡏⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⣿⣷⣶⡎⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
\033[0m"

# Display author information
echo " "
echo -e "$Red                               ⫸$Purple Made by M4T01 $Red ⫷\033[0m"
echo " "

# Display menu options
echo -e " $Green     |---------------------------------------------------------------------|"
echo -e " $Green     ||----------------------------$Cyan [List] $Green---------------------------||"
echo -e " $Green     ||                                                                   "
echo -e " $Green     ||             $Purple==>$Yellow[1] SETUP Server - 4GB RAM$Green                    "
echo -e " $Green     ||             $Purple==>️$Yellow[2] START Server - 4GB RAM$Green                       "
echo -e " $Green     ||             $Purple==>$Yellow[3] STOP Server$Green                            "
echo -e " $Green     ||             $Purple==>$Yellow[4] Server IP address$Green               "
echo -e " $Green     ||             $Purple==>$Yellow[5] SERVER UP-Time$Green                                  "
echo -e " $Green     ||             $Purple==>$Yellow[6] Uninstall Launcher$Green                                  "
echo -e " $Green     ||             $Purple==>$Yellow[7] About$Green                                          "
echo -e " $Green     ||             $Purple==>$Yellow[8] Exit$Green                                           "
echo -e " $Green     ||             $Purple==>$Yellow[9] Report Problems to my Telegram$Green                                        "
echo -e " $Green     ||             $Purple==>$Yellow[999] Reset/Update Launcher$Green                                           "
echo -e " $Green     ||                                                                   "                                                                                       
echo -e " $Green     ||---------------------------$Cyan [select option] $Green-----------------------||"
echo -e " $Green     |---------------------------------------------------------------------|"
echo " "
echo " "

# Read user input
read ch

# Handle user input
if [ $ch -eq 1 ]; then
    # Update and install necessary packages
    apt-get update -y
    apt-get upgrade -y
    pkg install openjdk-21 wget -y

    # Install paper server
    rm -rf $MINECRAFT_DIR
    mkdir -p $MINECRAFT_DIR && cd $MINECRAFT_DIR
    wget -O server.jar $MINECRAFT_DOWNLOAD_URL
    chmod +x server.jar
    echo "eula=TRUE" > eula.txt

    # Install plugins
    mkdir -p plugins && cd plugins
    wget -O "Geyser-Spigot.jar" $GEYSER_DOWNLOAD_URL
    wget -O "floodgate-spigot.jar" $FLOODGATE_DOWNLOAD_URL
    wget $VIA_VERSION_DOWNLOAD_URL
    wget $PLAYITGG_DOWNLOAD_URL
    cd ..

    # Start server
    java -Xmx4G -Xms4G -jar server.jar nogui
    exit
elif [ $ch -eq 2 ]; then
    # Start server
    cd $MINECRAFT_DIR
    while true; do
        java -Xms4G -Xmx4G -jar server.jar
        sleep 1
    done
    exit
elif [ $ch -eq 3 ]; then
    # Stop server
    /stop
    exit
elif [ $ch -eq 4 ]; then
    # Install Python3 and get server IP address
    apt-get install python3 -y
    git clone https://github.com/drmatoi/M4T01Picker.git
    cd M4T01Picker
    python3 ipicker.py
    exit
elif [ $ch -eq 5 ]; then
    # Display server uptime information
    echo -e "\e[1;34m The server is online as long as: The device on which it is running is connected to the Internet,
    there is enough memory and RAM, Termux is open and the script is not terminated.
    Yes the Server can crash. Should it start again automatically?
    POSSIBLE! Create before launching a new file with nano alwaysonline.sh put the script from this github and save it with [CTRL + X] 
    Now launch the Server with ./alwaysonline.sh This will check the up-time of the server and relaunch it when it's offline."
    cd $HOME
    exit
elif [ $ch -eq 999 ]; then
    # Reset/Update launcher
    rm -rf minecraft
    git clone https://github.com/nguyencongtu2004/minecraft.git
    cd minecraft
    chmod +x launcher.sh
    ./launcher.sh
    exit
elif [ $ch -eq 6 ]; then
    # Uninstall launcher
    cd $HOME
    rm -rf minecraft
    exit
elif [ $ch -eq 7 ]; then
    # Display about information
    echo -e "$Cyan How to Host a Minecraft Server on Android
    A script for Termux that makes it possible to host a Minecraft server via your Android phone. This script requires Termux (Updated F-Droid Version) and a bit of time :)
    Install script and UP-Time script are made by M4T01.
    YOU CANNOT USE THIS ON ANDROID 11 - SORRY! \e[1;36m"
    cd $HOME
    exit
elif [ $ch -eq 9 ]; then
    # Report problems to Telegram
    termux-open-url https://t.me/drmatoi
    exit
else
    # Invalid input
    echo -e "\e[4;32m Invalid Input !!! \e[0m"
    pause
fi
done