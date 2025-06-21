tmp=$(cat src/content/templates/template-post.typ)
dat=$(date +"%Y,%m,%d,%H,%M,%S")
dat_arr=(${dat//,/ })
printf "$tmp" ${dat_arr[0]} ${dat_arr[1]} ${dat_arr[2]} ${dat_arr[0]} ${dat_arr[1]} ${dat_arr[2]} ${dat_arr[3]} ${dat_arr[4]} ${dat_arr[5]} > src/content/typ/new-post.typ
