#!/bin/bash

# Constants - CHANGE ME!
readonly PROJECT='gke-confluent-atlas-254819'
readonly CLUSTER='storefront-api'
readonly REGION='europe-west2'
readonly ZONE='europe-west2-a'

# Delete GKE cluster (time in foreground)
time yes | gcloud beta container clusters delete $CLUSTER --zone $ZONE

# Confirm network resources are also deleted
gcloud compute forwarding-rules list
gcloud compute target-pools list
gcloud compute firewall-rules list

# In case target-pool associated with Cluster is not deleted
yes | gcloud compute target-pools delete  \
  $(gcloud compute target-pools list \
    --filter="region:($REGION)" --project $PROJECT \
  | awk 'NR==2 {print $1}')
