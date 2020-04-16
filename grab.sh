set -euo pipefail

URL=$1
TEST=`echo $1 | awk -F. '{print $NF}'`

REGEX='.*\?suite$|.*\?test$|.*\?whereUsed|.*remote_debug|.*purge.*|.*\?search$|.*UserGuide$|.*\?search$|.*RecentChanges$|.*\?refactor.*'

wget --page-requisites \
     --convert-links \
     --no-parent \
     -r -l 3 -nH \
     --adjust-extension \
     --accept-regex ".*$TEST.*" \
     --reject-regex $REGEX \
     $URL
