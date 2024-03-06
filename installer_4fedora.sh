echo "#####****     Updating dependencies       ****####"
sudo dnf update -y

echo "#####****     Installing Programming Dependencies...      ****####"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-35-x86_64/pgdg-fedora-repo-latest.noarch.rpm
sudo dnf update -y
sudo dnf install -y community-mysql-server dbeaver code postgresql gcc gcc-c++ nodejs npm python3 git docker kubernetes-cli dotnet java-latest-openjdk-devel postgresql11-server postgresql11 heimdal-devel


echo "Making MariaDB run at start"
sudo systemctl start mysqld
sudo systemctl enable mysqld
echo "alias connmaria = 'sudo mysql -u root -p'" >> ~/.bashrc

echo "Making shutdown shortcut"
echo "alias sdp = 'sudo shutdown -h now'" >> ~/.bashrc

cd ~/Downloads
echo "#####****     CYBERSECURITY SUITE      ****####"
echo "#Installing Pentesting/CTF tools..."

###### NMAP ######

echo "Nmap"

curl https://nmap.org/dist/nmap-7.94-1.x86_64.rpm
if sudo dnf install -y nmap ~/Downloads/nmap-7.94-1.x86_64.rpm; then
    echo "Installation successful!"
else 
    echo "Installation failed. Adding to list..."
    echo "~/Downloads/nmap-7.94-1.x86_64.rpm" >> ~/Downloads/failed_installs.txt
    echo "" >> ~/Downloads/failed_installs.txt
    echo "Successfully added to list"
fi


###### GOBUSTER ######

echo "Installing gobuster..."

if sudo dnf install -y gobuster; then
    echo "Installation successful!"
else
    echo "Installation failed. Adding to list..."
    echo "gobuster" >> ~/Downloads/failed_installs.txt
    echo "" >> ~/Downloads/failed_installs.txt
    echo "Successfully added to list"
fi
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
    echo "https://github.com/epsylon/xsser.git" >> ~/Downloads/failed_installs.txt
    echo "" >> ~/Downloads/failed_installs.txt
    echo "Successfully added to list"
fi
#######
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

echo "Installing OpenVAS"
sudo dnf install -y gnupg cmake pkg-config libglib2.0-dev libgpgme-dev libgnutls28-dev uuid-dev libssh-gcrypt-dev libldap2-dev doxygen graphviz libxml2-dev libpcap-dev bison libksba-dev libsnmp-dev libgcrypt20-dev libradcli-dev libhiredis-dev libsqlite3-dev libical-dev postgresql postgresql-contrib postgresql-server-dev-all redis-server sqlite3 xmltoman gcc-mingw-w64 heimdal-dev
sudo dnf install -y gvm-tools
echo "OpenVAS installed successfully, please set it up manually\n\n\n"

#######
: ' 
    ADD INSTALL ONE-GADGET

'

#######

###### DLLINJECTOR ######

echo "Installing DLLInjector..."

sudo dnf install -y git gcc gcc-c++ make cmake
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
    cd libformatstr
    make
    sudo make install
else 
    echo "Installation failed. Adding to list..."
    echo "https://github.com/hellman/libformatstr.git" >> ~/Downloads/failed_installs.txt
    echo "" >> ~/Downloads/failed_installs.txt
    echo "Successfully added to list"
fi

###### JOHN THE RIPPER ######
echo "Installing John the Ripper"
if sudo dnf install -y john; then 
    echo "Installed successfully!"
else 
    echo "Installation failed. Adding to list..."
    echo "john" >> ~/Downloads/failed_installs.txt
    echo "" >> ~/Downloads/failed_installs.txt
    echo "Successfully added to list"
###### NETCAT ######

echo "Installing netcat..."

if sudo dnf install -y nmap-ncat; then
    echo "ncat installed successfully!"
else
    echo "Installation failed. Adding to list..."
    echo "netcat" >> ~/Downloads/failed_installs.txt
    echo "" >> ~Downloads/failed_installs.txt
    echo "Successfully added to list"
fi

###### TCPDUMP ######

echo "Installing tcpdump..."

if sudo dnf install -y tcpdump; then
    echo "tcpdump installed successfully!"
else 
    echo "Installation failed. Adding to list..."
    echo "tcpdump" >> ~/Downloads/failed_installs.txt
    echo "" >> ~Downloads/failed_installs.txt
    echo "Successfully added to list"
fi

###### OPENSSL ######

echo "Installing openssl..."
if sudo dnf install -y openssl; then
    echo "openssl installed successfully!"
else 
    echo "Installation failed. Adding to list..."
    echo "openssl" >> ~/Downloads/failed_installs.txt
    echo "" >> ~Downloads/failed_installs.txt
    echo "Successfully added to list"
fi

###### QWASP ZAP ######

: '
        ADD DOWNLOADER QWASP ZAP
'

###### QIRA ######

echo "Installing Qira"

if git clone https://github.com/geohot/qira.git ~/qira; then
    cd qira
    make
    sudo make install
else 
    echo "Installation failed. Adding to list..."
    echo "https://github.com/geohot/qira.git" >> ~/Downloads/failed_installs.txt
    echo "" >> ~/Downloads/failed_installs.txt
    echo "Successfully added to list"
fi
