#! /bin/bash

YELLOW="$(tput setaf 3)"
GREEN="$(tput setaf 2)"
NORMAL="$(tput sgr0)"
DOWNLOAD_LINK=""
IDE=""
IDE_NAME=""
URL=""

read -p "${YELLOW}This script will download Jetbrains IDE, you will need to activate them!${GREEN} [Press ENTER to continue]"
echo

printf "Which IDE do you want to downlaod?\n"
printf "[1] - Clion\n"
printf "[2] - Pycharm\n"
printf "[3] - WebStorm\n"
printf "[4] - RubyMine\n"
printf "[5] - IntelliJ IDEA\n"
printf "[6] - GoLand\n"

read -p "${YELLOW}Write the number associated to the IDE ${NORMAL} " -n 1 -r

if [[ $REPLY =~ ^[1]$ ]]; then
    DOWNLOAD_LINK="https://download.jetbrains.com/cpp/CLion-2019.2.4.tar.gz"
    URl="https://www.jetbrains.com/clion/download/#section=linux"
    IDE="clion"
    IDE_NAME="CLion"
elif [[ $REPLY =~ ^[2]$ ]]; then
    DOWNLOAD_LINK="https://download.jetbrains.com/python/pycharm-professional-2019.2.3.tar.gz"
    URL="https://www.jetbrains.com/pycharm/download/#section=linux"
    IDE="pycharm"
    IDE_NAME="PyCharm"
elif [[ $REPLY =~ ^[3]$ ]]; then
    DOWNLOAD_LINK="https://download.jetbrains.com/webstorm/WebStorm-2019.2.3.tar.gz"
    URl="https://www.jetbrains.com/webstorm/download/#section=linux"
    IDE="webstorm"
    IDE_NAME="WebStorm"
elif [[ $REPLY =~ ^[4]$ ]]; then
    DOWNLOAD_LINK="https://download.jetbrains.com/ruby/RubyMine-2019.2.3.tar.gz"
    URl="https://www.jetbrains.com/ruby/download/#section=linux"
    IDE="rubymine"
    IDE_NAME="RubyMine"
elif [[ $REPLY =~ ^[5]$ ]]; then
    DOWNLOAD_LINK="https://download.jetbrains.com/idea/ideaIU-2019.2.3.tar.gz"
    URl="https://www.jetbrains.com/idea/download/#section=linux"
    IDE="idea"
    IDE_NAME="IntelliJ IDEA"
elif [[ $REPLY =~ ^[6]$ ]]; then
    DOWNLOAD_LINK="https://download.jetbrains.com/go/goland-2019.2.3.tar.gz"
    URl="https://www.jetbrains.com/go/download/#section=linux"
    IDE="goland"
    IDE_NAME="GoLand"
else
    printf "\nWrong number, exiting the script ${GREEN}${DOWNLOAD_LINK}${NORMAL}\n"
    exit 1
fi

printf "\nThe software will be downloaded from ${GREEN}${DOWNLOAD_LINK}${NORMAL}\n"
printf "If you want a more recent version, you will be moved to the download page\n"
printf "Do not download the file from your browser, but get the direct link of the file, you will need it after\n"
read -p "${YELLOW}Keep the current version? ${NORMAL}[y or n] " -n 1 -r

echo
if [[ $REPLY =~ ^[Nn]$ ]]; then
  xdg-open URL
  while [ true ]; do
      echo
      read -p "${YELLOW}paste the direct link${GREEN} " DOWNLOAD_LINK
      echo
      read -p "${NORMAL}$DOWNLOAD_LINK is correct?$ [y or n] " -n 1 -r
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        break
      fi
  done
fi

printf "${YELLOW}The file will now be downlaoded to /tmp and moved to /opt so it needs sudo rights${NORMAL}\n"
cd /tmp
mkdir jetbrains ; cd jetbrains
wget --output-document $IDE.tgz $DOWNLOAD_LINK
tar -zxvf $IDE.tgz
rm -fr $IDE.tgz
mv * $IDE
sudo mv $IDE /opt
mkdir -p ~/.local/share/applications
cd ~/.local/share/applications
touch $IDE.desktop

echo "[Desktop Entry]" >> $IDE.desktop
echo "Type=Application" >> $IDE.desktop
echo "Name=$IDE_NAME" >> $IDE.desktop
echo "Icon=/opt/$IDE/bin/$IDE.png" >> $IDE.desktop
echo "Exec=/opt/$IDE/bin/$IDE.sh" >> $IDE.desktop
echo "Terminal=false" >> $IDE.desktop
echo "Comment=Jetbrains IDE" >> $IDE.desktop
echo "Categories=Development;IDE;" >> $IDE.desktop

read -p "${YELLOW}$IDE is now installed and a shortcut has been created!${GREEN} [Press ENTER to quit]"