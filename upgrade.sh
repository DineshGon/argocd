#!/bin/bash

# exit when any command fails
set -e

new_ver=$1

echo "new version: $new_ver"

# Simulate release of the new docker images
docker tag nginx:1.23.3 dineshd385/nginx:$new_ver

# Push new version to dockerhub
docker push dineshd385/nginx:$new_ver

# Create temporary folder
tmp_dir=$(mktemp -d)
echo $tmp_dir

# Clone GitHub repo
git clone https://github.com/DineshGon/argocd.git $tmp_dir

# Update image tag
# sed -i '' -e "s/dineshd385\/nginx:.*/dineshd385\/nginx:$new_ver/g" $tmp_dir/01argocd/deployment.yaml
# Update image tag in deployment.yaml based on the OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' -e "s|dineshd385/nginx:.*|dineshd385/nginx:$new_ver|g" "$tmp_dir/01argocd/deployment.yaml"
else
  sed -i'' -e "s|dineshd385/nginx:.*|dineshd385/nginx:$new_ver|g" "$tmp_dir/01argocd/deployment.yaml"
fi

# Commit and push
cd $tmp_dir
git add .
git commit -m "Update image to $new_ver"
git push

# Optionally on build agents - remove folder
rm -rf $tmp_dir