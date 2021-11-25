#!/bin/sh

if [ $# -lt 2 ]; then
  printf "\n  Usage: ${0##*/} [required] [optional]\n\n"
  printf "    Required:\n"
  printf "      --registry                  example:  registry.example.com\n\n"
  printf "    Optional:\n"
  printf "      --push                      push image to repository\n"
  printf "      --repo-prefix               example:  demo-app (e.g. demo-app-coffee and demo-app-tea)\n\n"
  exit 1
fi

while [ $# -gt 1 ]; do
  case "$1" in
    "--push" )
        push=true
        shift;
        ;;
    "--registry" )
        registry=$2
        shift; shift
        ;;
    "--repo-prefix" )
        repo_prefix=$2
        shift; shift
        ;;
    * )
        printf "\n  Invalid argument: $1\n\n"
        exit 1
        ;;
  esac
done

if [ -z "${repo_prefix}" ]; then
  repo_prefix=demo-app
fi

docker build -f Dockerfile.coffee -t ${registry}/${repo_prefix}-coffee:latest .
docker build -f Dockerfile.tea -t ${registry}/${repo_prefix}-tea:latest .

if [ "${push}" == "true" ]; then
  docker push ${registry}/${repo_prefix}-coffee:latest
  docker push ${registry}/${repo_prefix}-tea:latest
fi
