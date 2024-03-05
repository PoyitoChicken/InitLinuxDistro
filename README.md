# Init Linux Distros | ALFA VERSION COPY AT YOUR OWN RISK
Install DB and CyberSec dependencies for FedoraSec

## Process
0. Download git (depends on your package manager)
### Fedora
````
sudo dnf update
````
````
sudo dnf install git
````
### Debian, Mint, Pop
````
sudo apt update
````
````
sudo apt install git
````
### Arch
````
sudo pacman -Sy
````
````
sudo pacman -S git
````
1. Clone the repository  
```
git clone https://github.com/PoyitoChicken/initFedoraSec.git installers
```
2. Navigate to the folder
```
cd installers
```
3. Make it an executable file
```
chmod +x installer.sh
```
4. Run the installer
```
./installer
```
