set -euo pipefail

URL=$1

wget --page-requisites \
     --convert-links \
     --no-parent \
     -r -l 3 -nH \
     --adjust-extension \
     --reject-regex \
     '.*\?suite$|.*\?test$|.*\?whereUsed|.*remote_debug|.*purge.*|.*\?search$|.*UserGuide$|.*\?search$|.*RecentChanges$' \
     $URL
