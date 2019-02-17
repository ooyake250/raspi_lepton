#!/bin/bash -x

cd /home/pi

##P.101のコマンド
#パッケージ情報の更新と適用
sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y install qt4-dev-tools
sudo apt-get -y install git

#spiを有効にする
sudo raspi-config nonint do_spi 0

#i2cを有効にする
sudo raspi-config nonint do_i2c 0

#lentonディレクトリを作成する
mkdir lepton
cd lepton

#LentonModuleをダウンロードする
git clone https://github.com/groupgets/LeptonModule

#ディレクトリを/home/pi/lepton/LeptonModule/software/raspberrypi_libs/leptonSDKEmb32PUBに移動する
cd LeptonModule/software/raspberrypi_libs/leptonSDKEmb32PUB
make

#ディレクトリをraspberrypi_videoに移動する
cd ../../raspberrypi_video

#LeptonThread.cppを編集する
sed -i -e 's|colormap_ironblack;|colormap_rainbow;|' LeptonThread.cpp

#パッケージをビルドしてraspberrypi_videoを作成する
qmake && make

#i2cとspiを有効にするため再起動する
#reboot
