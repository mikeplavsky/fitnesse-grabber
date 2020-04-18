set -euo pipefail

VER=0.1

az container create \
    --resource-group mp-fitnesse-results \
    --name fitnesse \
    --image mikeplavsky/fitnesse-grabber:$VER \
    --restart-policy Never \
    --command-line 'sleep 3600' 
