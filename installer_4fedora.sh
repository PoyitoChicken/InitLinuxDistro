echo "#####****     Installing Programming Dependencies...      ****####"
touch "$HOME/Downloads/failed_installs.txt"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-35-x86_64/pgdg-fedora-repo-latest.noarch.rpm
echo "#####****     Updating dependencies       ****####"
sudo dnf update -y
# sudo dnf install -y community-mysql-server nmap dbeaver code postgresql gcc gcc-c++ nodejs npm python3 git docker kubernetes-cli dotnet java-latest-openjdk-devel postgresql11-server postgresql11 heimdal-devel
####       MYSQL NEEDS TO BE ENABLED SO NOT CALLED IN FUNCTION
if sudo dnf install -y community-mysql-server; then
    echo "mysql installed correctly"
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    echo "mysql server active"
    echo "alias conmaria='sudo mysql -u root -p'" >> ~/.bashrc
else 
    echo "Installation failed. Adding to list..."
    echo "mysql" >> $HOME/Downloads/failed_installs.txt
    echo "" >> $HOME/Downloads/failed_installs.txt
    echo "Successfully added to list"
fi

install_packages(){
    local package_name=$1

    if sudo dnf install -y "$package_name"; then
        echo "$package_name installed correctly!"
    else 
        echo "Installation failed. Adding to list..."
        echo "$package_name" >> $HOME/Downloads/failed_installs.txt
        echo "" >> $HOME/Downloads/failed_installs.txt
        echo "Successfully added to list"
    fi
}
install_packages "community_mysql_server"
install_packages "nmap"
###### install_packages "dbeaver" DOESNT WORK
install_packages "code"
###### install_packages "postgresql" DOESNT WORK
install_packages "gcc"
install_packages "gcc-c++"
install_packages "nodejs"
install_packages "npm"
install_packages "pip"
install_packages "python3"
install_packages "docker"
install_packages "kubernetes-cli"
install_packages "dotnet"
install_packages "java-latest-openjdk-devel"
install_packages "postgresql11-server"
install_packages "postgresql11"
install_packages "heimdal-devel"

echo "Making shutdown shortcut"
echo "alias sdp='sudo shutdown -h now'" >> ~/.bashrc
source ~/.bashrc
cd ~/Downloads
echo "#####****     CYBERSECURITY SUITE      ****####"
echo "#Installing Pentesting/CTF tools..."

###### NMAP ######
echo "\n\nInstalling nmap..."
install_packages "nmap"

###### GOBUSTER ######

echo "Installing gobuster..."
install_packages "gobuster"
###### XSSER ######


echo "Installing XSSer..."


if git clone https://github.com/epsylon/xsser.git ~/xsser; then
    if printf '\nexport PATH="$HOME/xsser:$PATH"\n' >> ~/.bashrc; then
        source ~/.bashrc
        echo "Successfully installed and referenced xsser!"
    else
        echo "Installed successfully but not added to ~/.bashrc"
    fi
else
    echo "Installation failed. Adding to list..."
    echo "https://github.com/epsylon/xsser.git" >> $HOME/Downloads/failed_installs.txt
    echo "" >> ~/Downloads/failed_installs.txt
    echo "Successfully added to list"
fi
#######
###### METASPLOIT ######
## Install failed server down
cd ~/Downloads
wget http://downloads.metasploit.com/data/releases/framework-latest.tar.bz2
tar -jxf framework-latest.tar.bz2
sudo mkdir -p /opt/metasploit4
sudo cp -a msf/ /opt/metasploit4/msf
sudo chown root:root -R /opt/metasploit4/msf
sudo ln -sf /opt/metasploit4/msf/msf* /usr/local/bin/
: ' 
    ADD INSTALL METASPLOIT 
    https://fedoraproject.org/wiki/Metasploit
    wget http://downloads.metasploit.com/data/releases/framework-latest.tar.bz2
    tar -jxf framework-latest.tar.bz2
    sudo mkdir -p /opt/metasploit4
    sudo cp -a msf/ /opt/metasploit4/msf
    sudo chown root:root -R /opt/metasploit4/msf
    sudo ln -sf /opt/metasploit4/msf/msf* /usr/local/bin/

'

#######
###### OPENVAS ######
cd ~
echo "Installing OpenVAS"
sudo dnf install -y https://updates.atomicorp.com/channels/atomic/fedora/$(rpm -E %fedora)/x86_64/RPMS/atomic-release-1.0-21.fc$(rpm -E %fedora).art.noarch.rpm
sudo dnf install -y openvas
sudo openvas-setup
alias openvas-start='sudo systemctl start openvas-scanner && sudo systemctl start openvas-manager && sudo systemctl start openvas-gsa'

#######
: ' 
    ADD INSTALL ONE-GADGET

'

#######

###### DLLINJECTOR ######
#### FAILED IDK WHERE
cd ~/Downloads
echo "Installing DLLInjector..."

install_packages "gcc"
install_packages "gcc-c++"
install_packages "make"
install_packages "cmake"

git clone https://github.com/OpenSecurityResearch/dllinjector.git
cd dllinjector
mkdir build
cd build
cmake ..
make
printf '\nexport PATH="$HOME/dllinjector/build:$PATH"\n' >> ~/.bashrc
cd ~/Downloads

###### LIBFORMATSTR ######

if git clone https://github.com/hellman/libformatstr.git ~/libformatstr; then
    cd ~/libformatstr
    make
    sudo make install
else 
    echo "Installation failed. Adding to list..."
    echo "https://github.com/hellman/libformatstr.git" >> $HOME/Downloads/failed_installs.txt
    echo "" >> $HOME/Downloads/failed_installs.txt
    echo "Successfully added to list"
fi

###### JOHN THE RIPPER ######
echo "Installing John the Ripper"
install_packages "john"
###### NETCAT ######

echo "Installing netcat..."
install_packages "nmcap-ncat"

###### TCPDUMP ######

echo "Installing tcpdump..."
install_packages "tcpdump"

###### OPENSSL ######

echo "Installing openssl..."
install_packages "openssl"


###### QWASP ZAP ######

: '
        ADD DOWNLOADER QWASP ZAP
'

###### QIRA ######

echo "Installing Qira"

if git clone https://github.com/geohot/qira.git ~/qira; then
    cd ~/qira
    make
    sudo make install
else 
    echo "Installation failed. Adding to list..."
    echo "https://github.com/geohot/qira.git" >> $HOME/Downloads/failed_installs.txt
    echo "" >> $HOME/Downloads/failed_installs.txt
    echo "Successfully added to list"
fi
