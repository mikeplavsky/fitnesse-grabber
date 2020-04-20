set -euo pipefail

docker rm -f grabber || true

docker run -ti -v $(pwd):/grabber \
        -w /grabber \
        --name=grabber grabber \
        bash
