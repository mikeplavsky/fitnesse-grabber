set -euo pipefail

URL=$1
TEST=`echo $1 | \
      awk -F/ '{print $NF}' | \
      sed 's/\./\\\\./g'`

echo $TEST

REGEX='.*\?suite$|.*\?test$|.*\?whereUsed|.*remote_debug|.*purge.*|.*\?search$|.*UserGuide$|.*\?search$|.*RecentChanges$|.*\?refactor.*'

rm -r result || true

wget --page-requisites \
     --directory-prefix=result \
     --convert-links \
     --no-parent \
     -r -l 3 -nH \
     --adjust-extension \
     --accept-regex ".*$TEST.*|.*files.*" \
     --reject-regex $REGEX \
     $URL
