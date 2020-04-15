set -euo pipefail

URL=$1

wget --page-requisites \
     --convert-links \
     --no-parent \
     -r -l 2 -nH \
     --adjust-extension \
     --reject-regex '.*purge.* | .*suite$' $URL
