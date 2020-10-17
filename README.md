
# Github Action for deleting Google Cloud Dataproc cluster

A Github Action to delete a dataproc cluster after your test use-cases.

## Usage

```yaml
# Setup gcloud CLI
- uses: GoogleCloudPlatform/github-actions/setup-gcloud@master
  with:
    version: '314.0.0'
    service_account_key: ${{ secrets.service_account_key }}
    service_account_email: ${{ secrets.service_account_email }}
    project_id: ${{ secrets.project_id }}
    export_default_credentials: true
- run: gcloud info

- name: Create Google Cloud Dataproc cluster
  uses: vishnudxb/gcloud-dataproc-creation@main
  with:
    cluster: "your dataproc cluster name"
    region: "Your dataproc luster region"
    project: "Your gcloud project id"
    initialization-actions: "gs://<your bucket>/<initialization-script.sh>"
    master-boot-disk-size: "500GB"
    master-boot-disk-type: "pd-standard"
    master-machine-type: "n1-standard-2"
    max-idle: "1h"
    num-masters: 1
    worker-boot-disk-size: "500GB"
    worker-boot-disk-type: "pd-standard"
    worker-machine-type: "n1-standard-2"
    zone: "us-east1-b"
    image-version: "preview-ubuntu18"
    metadata: "PIP_PACKAGES=$(sed -e '/^#/d' -e 's/#.*$//' -e 's/ *$//g' requirements.txt | tr '\n' ' ')"
    scopes: "https://www.googleapis.com/auth/cloud-platform"
    num-workers: 2
    properties: "spark:spark.scheduler.mode=FIFO"

- name: Delete Google Cloud Dataproc cluster
  uses: vishnudxb/gcloud-dataproc-deletion@main
  with:
    cluster: "your dataproc cluster name"
    region: "Your dataproc luster region"
    project: "Your gcloud project id"

```

### The inputs description:

```yaml
inputs:
  cluster:
    description: 'Enter your gcloud dataproc cluster name'
    required: true
  region:
    description: 'Enter your gcloud dataproc cluster region'
    required: true
  project:
    description: 'Enter your gcloud project id'
    required: true
```
