
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
