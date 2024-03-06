# Init Linux Distros | ALFA VERSION COPY AT YOUR OWN RISK
Install DB and CyberSec dependencies for FedoraSec

## Process
0. Download git (depends on your package manager)
* Fedora
````
sudo dnf update -y
````
````
sudo dnf install -y git
````
* Debian, Mint, Pop
````
sudo apt update -y
````
````
sudo apt install -y git
````
* Arch
````
sudo pacman -Sy --noconfirm
````
````
sudo pacman -S git --noconfirm
````
1. Clone the repository  
```
git clone https://github.com/PoyitoChicken/initFedoraSec.git ~/Downloads/installers
```
2. Navigate to the folder
```
cd installers
```
3. Make it an executable file installer_4(your package manager).sh
```
chmod +x installer.sh
```
4. Run the installer installer_4(your package manager).sh
```
./installer
```
