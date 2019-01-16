#!/bin/sh
true=1
false=0

init(){
  osName=`uname -s`
  osVersion=`cat /etc/issue | head -1 | awk '{print $1}'`

  if [ "${osName}" != "Linux" ];then
    echo "This script works only on Linux OS."
    return ${false}
  fi

  case ${osVersion} in
    CentOS)
    ;;
    Ubuntu)
    ;;
    *)
      echo "This is an unsupported OS version. [${osVersion}]"
      return ${false}
  esac

  if [ "${USER}" == "root" ];then
    isRoot=${true}
  else
    isRoot=${false}
    printf "Enter the password for the account for the sudo command. : ";read passwd
  fi

  return ${true}
}

InstallationZsh(){

  if Exists zsh;then
    echo "zsh is already installed."
    return ${true}
  else
    case ${osVersion} in
      CentOS)
      InstallPackageCentOS zsh
      ;;
      Ubuntu)
      InstallPackageUbuntu zsh
      ;;
    esac
  fi

  if Exists zsh;then
    return ${true}
  else
    return ${false}
  fi
}

Exists()
{
  command -v "$1" >/dev/null 2>&1
}

InstallPackageCentOS(){
  packageName=${1}
  if [ ${isRoot} -eq "${true}" ];then
    yum install -y ${packageName}
  else
    echo ${passwd} | sudo -S yum install -y ${packageName}
  fi
}

InstallPackageUbuntu(){
  if [ ${isRoot} -eq "${true}" ];then
    apt-get install -y ${packageName}
  else
    apt-get ${passwd} | sudo -S yum install -y ${packageName}
  fi
}

InstallationOhMyZsh(){
  echo ${passwd} | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

GetProfiles(){
  curl -L -o ${HOME}/.zshrc https://raw.githubusercontent.com/kimdhe88/Utility/master/Profiles/.zshrc
  curl -L -o ${HOME}/.aliases https://raw.githubusercontent.com/kimdhe88/Utility/master/Profiles/.aliases
}

main(){
  init;rstcode=$?
  if [ ${rstcode} -eq ${false} ]; then
    return
  fi

  InstallationZsh;rstcode=$?
  if [ ${rstcode} -eq ${false} ]; then
    echo "Zsh Installation failed"
    return
  fi

  InstallationOhMyZsh

  GetProfiles

  source ${HOME}/.zshrc
}

main
