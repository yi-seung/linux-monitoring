#!/usr/bin/env bash
echo "####################################################################################################"
echo "##### Docker 설치 #####"
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce

#sudo usermod -aG docker admin                                  # admin 계정의 docker 권한 추가
seung usermod -aG docker seung
sudo systemctl start docker && sudo systemctl enable docker    # docker 시작 및 서비스 활성화
sudo docker stop $(docker ps -a -q) && sudo docker rm $(docker ps -a -q) && sudo docker rmi $(docker images -q)
sudo docker system prune --force
sudo systemctl daemon-reload
sudo systemctl restart docker