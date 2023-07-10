sudo apt-get update
wget https://github.com/admb-project/admb/releases/download/admb-13.1/admb-13.1-linux.zip
sudo unzip admb-13.1-linux.zip && mv admb-13.1 admb
sudo rm admb-13.1-linux.zip
sudo chmod 777 admb
sudo cp -Rvf admb /usr/local/admb
export PATH=$PATH:/usr/local/admb/bin

cd /workflows/ss3-build-devcontainer
wget https://github.com/nmfs-stock-synthesis/stock-synthesis/archive/main.zip
sudo unzip -o main.zip -d /usr/local/bin
sudo chmod 777 /usr/local/bin/stock-synthesis-main
cd /usr/local/bin/stock-synthesis-main
sudo make
mv /usr/local/bin/stock-synthesis-main/ss /workspaces/ss3-build-devcontainer/ss

echo 'options(repos = c(CRAN = \"https://cloud.r-project.org\"))'
sudo sh -c 'cat - >>\"${R_HOME}/etc/Rprofile.site\"'