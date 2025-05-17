# /usr/bin/zsh

BASE_DIR=$(dirname "$0")
TABBY_AGENT="${BASE_DIR}/node_modules/.bin/tabby-agent --stdio"

if [ "z${DEBUG}" = "z" ]; then
    ${TABBY_AGENT}
else
    { tee ${BASE_DIR}/stdin.txt | ${TABBY_AGENT} 2>&1 1>&3 3>&- | tee ${BASE_DIR}/stderr.txt ; } 3>&1 1>&2 | tee ${BASE_DIR}/stdout.txt
fi
