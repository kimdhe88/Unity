#!/bin/sh

osName=`uname -s`
osVersion=`cat /etc/issue | awk '{print $1}'`
case ${osNAme} in
  Linux)
  echo "Current OS type is [ ${osNAme} ]"
  case ${osVersion} in
    Linux)
    echo "Current OS version is [ ${osVersion} ]"
    ;;
    Ubuntu)
    echo "Current OS version is [ ${osVersion} ]"
    ;;
    *)
      echo "This is an unsupported OS version. [${osVersion}]"
    ;;
    esac

  ;;
  *)
  echo "This is an unsupported OS. [${osNAme}]"
  ;;
esac
