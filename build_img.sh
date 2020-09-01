#!/bin/bash

usage()
{
  echo "Usage:  
  [ -h ] Display this help guide 
  [ -r ] The repository to build
  [ -a ] The app name, will be used to tag the image
  [ -u ] The Docker Hub username"
  exit 2
}  


REPO=""
APP_NAME=""
DHUB_NAME=""

while getopts 'hr:a:u:' flag; do
  case "${flag}" in
    h) usage ;;
    r) REPO="${OPTARG}" ;;
    a) APP_NAME="${OPTARG}" ;;
    u) DHUB_NAME="${OPTARG}" ;;
  esac
done

if [ -n "$REPO" ] 
  then
    if [ -n "$APP_NAME" ]
      then
        if [ -n "$DHUB_NAME" ]
          then
            echo "Starting docker build for $REPO with tag $DHUB_NAME/$APP_NAME"
            docker build -t $DHUB_NAME/$APP_NAME $REPO
            echo "Pushing the image to Docker Hub"
            docker login -u jamomani
            docker push $DHUB_NAME/$APP_NAME
          else
            echo "No Docker Hub name given, it can be passed with the -u flag"
            usage
        fi
      else
        echo "No app name given, it can be passed with the -a flag"
        usage
    fi
  else 
    echo "No repository given. Pass the repository with the -r flag"
    usage
fi



