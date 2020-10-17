#!/bin/sh

set -e

cluster=$1
region=$2
project=$3

gcloud dataproc clusters delete \
    $cluster \
    --region=$region \
    --project=$project \
    --quiet
    --async
