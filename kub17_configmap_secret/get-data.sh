#!/bin/bash
### How to use:
### ./get-data.sh list_name
### Examples:
### ./get-data.sh "security-tool-servers-list"
### ./get-data.sh "security-tool-users-list"

main() {
  list_name=$1
  get_data $list_name
}

get_data() {
  echo $(decode_base64 "$(get_secret_data "${1}")")
}

get_secret_data() {
  echo $(oc get secrets/${1} --template='{{ range $key, $value := .data }}{{ printf "%s,%s " $key $value }}{{ end }}')
}

decode_base64() {
  for i in $1; do
    KEY=${i%,*};
    VAL=$(echo "${i#*,}" | base64 -d);
    printf "${KEY},${VAL} "
  done
}

main $@
