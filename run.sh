set -euo pipefail

URL=$1

docker run --rm -v $(pwd):/grabber \
        -w /grabber \
        --name=grabber grabber bash ./grab.sh $URL
