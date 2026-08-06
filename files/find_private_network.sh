#/bin/bash
set -euo pipefail
IFS=$'\n\t'

result=$(ip -j addr | jq -r '.[] | select(.addr_info[]?.local | test("^(10\\.|172\\.(1[6-9]|2[0-9]|3[0-1])\\.|192\\.168\\.)")) | .ifname')

if [[ -z "$result" ]]; then
    echo "No private network found"
    exit 1
fi

echo $result