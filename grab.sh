set -euo pipefail

URL=$1
FILES=`dirname $1`/files/

R_TESTS=`echo $1 | sed 's/\./\\\\./g' | sed 's/\//\\\\\//g'`
echo $R_TESTS

rm -r result || true

REGEX='.*\?suite$|.*\?test$|.*\?whereUsed|.*remote_debug|.*purge.*|.*\?search$|.*UserGuide$|.*\?search$|.*RecentChanges$|.*\?refactor.*|.*\?delete.*|.*\?responder.*|.*\?new.|.*\?edit.*|.*\?versions.*|.*\?properties.*'

wget --page-requisites \
     --directory-prefix=result \
     --convert-links \
     --no-parent \
     -r -l 3 -nH \
     --adjust-extension \
     --accept-regex "$R_TESTS($|\?|\.)|files" \
     --reject-regex $REGEX \
     $URL
