# Lepton Module セットアップのための最小限のスクリプト

- raspberry piインストール後に raspberrypi_video 実行プログラムを作成するまでの、必要最小限のスクリプト
- コピー＆ペーストできるようにスペースの数を３個にしています。
- 下記に示す内容は 01.sh スクリプトにコメント付きで載せています。

~~~bash
cd   /home/pi

sudo   apt-get   update
sudo   apt-get   -y   upgrade

sudo   apt-get   -y   install   qt4-dev-tools
sudo   apt-get   -y   install   git

sudo   raspi-config   nonint   do_spi   0

sudo   raspi-config   nonint   do_i2c   0

mkdir   lepton
cd      lepton

git   clone   https://github.com/groupgets/LeptonModule

cd   LeptonModule/software/raspberrypi_libs/leptonSDKEmb32PUB
make

cd   ../../raspberrypi_video

sed   -i   -e   's|colormap_ironblack;|colormap_rainbow;|'   LeptonThread.cpp

qmake   &&   make

reboot

~~~
