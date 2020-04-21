set -euo pipefail

URL=$1
DIR=$2

R_TESTS=`echo $1 | sed 's/\./\\\\./g' | sed 's/\//\\\\\//g'`
echo $R_TESTS

rm -r result || true

REGEX='.*\?suite$|.*\?test$|.*\?whereUsed|.*remote_debug|.*purge.*|.*\?search$|.*UserGuide$|.*\?search$|.*RecentChanges$|.*\?refactor.*|.*\?delete.*|.*\?responder.*|.*\?new.|.*\?edit.*|.*\?versions.*|.*\?properties.*|.*testResults.*'

wget --page-requisites \
     --directory-prefix=result \
     --convert-links \
     -r -nH \
     --adjust-extension \
     --accept-regex "$R_TESTS\$|$R_TESTS\..*|$R_TESTS\?.*|files\/fitnesse" \
     --reject-regex $REGEX \
     $URL || true

echo "copying to S3 ..."
aws s3 sync result/ s3://rmad-fitnesse-results/$DIR
