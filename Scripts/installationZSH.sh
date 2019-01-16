#!/bin/sh
true=1
false=0

init(){
  isROOT=${false}
}

main(){
  rstcode=IsInstalled
  echo "zsh install code is : ${rstcode}"
}

IsInstalled(){
  if [ -x (command -v zsh) ];then
    return ${true}
  else
    return ${false}
  fi
}

init
main


testFunc(){
  printf "Enter the password for sudo privileges. : ";read passwd
  printf "Enter the password for sudo privileges. : ";read passwd


  osName=`uname -s`
  osVersion=`cat /etc/issue | head -1 | awk '{print $1}'`
  case ${osName} in
    Linux)
    echo "Current OS type is [${osName}]"
    case ${osVersion} in
      CentOS)
      echo "Current OS version is [${osVersion}]"
      yum
      ;;
      Ubuntu)
      echo "Current OS version is [${osVersion}]"
      ;;

      *)
        echo "This is an unsupported OS version. [${osVersion}]"
      ;;
      esac
    ;;
    *)
    echo "This is an unsupported OS. [${osName}]"
    ;;
  esac



  sudo -S rpm -Uvh http://opensource.wandisco.com/centos/6/git/x86_64/wandisco-git-release-6-1.noarch.rpm
  yum --enablerepo=WANdisco-git --disablerepo=base,updates install -y git nss curl libcurl

  csch -s `which zsh`

}
