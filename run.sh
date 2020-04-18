set -euo pipefail

URL=$1

docker rm -f grabber || true

docker run -ti -v $(pwd):/grabber \
        -w /grabber \
        --name=grabber grabber bash #./grab.sh $URL
