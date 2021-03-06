#!/bin/sh

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "install-docker.sh -install <debian|ubuntu>"
  exit
fi

case $2 in
	"debian")
		sudo apt-get update
		sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
		curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add
		sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
		sudo apt-get update
		sudo apt-get install docker-ce;;
    	"ubuntu")
		sudo apt-get update
		sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
		sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
		sudo apt-get update
		sudo apt-get install docker-ce;;
	
	*) exit;;
esac
