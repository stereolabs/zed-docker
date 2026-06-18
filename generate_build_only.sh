# Edit the rule in .gitlab-ci.yml (which contains both build and push) 
# then run this script to generate the .gitlab-ci_build_only.yml for build only

output=".gitlab-ci_build_only.yml"
cp .gitlab-ci.yml ${output}

sed -i -e 's/_push//g' ${output}
sed -i '/docker push/d' ${output}
sed -i '/docker login/d' ${output}
sed -i '/docker tag/d' ${output}
sed -i '/only:/d' ${output}
sed -i '/- tags/d' ${output}
