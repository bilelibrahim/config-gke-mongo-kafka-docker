#!/bin/bash

# commit code changes to GitHub for all storefront projects
# usage: sh ./git_helper.sh "Refactoring storefront code"

args=("$@")

root="/Users/bilel/Documents/projects"
repos=(
  accounts
  orders
  fulfillment
  eureka-server
  zuul-proxy
  kafka-docker
)
if [ -n "${args[0]}" ]; then
    comment=${args[0]}
else
    comment="Automated commit of changes to project"
fi

for repo in "${repos[@]}"
do
  cd ${root}/${repo} && \
  git add -A && \
  git commit -m "${comment}" && \
  git push && \
  git status
  echo ${repo}
done

cd ../
