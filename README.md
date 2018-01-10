# g8 docker wrapper

Build:

```
docker build -t g8-docker .
```

Usage:

```
docker run -it g8-docker g8 deploy app.yaml --dry
```

Using cloudbuild.yaml

```
- name: 'gcr.io/cloud-builders/docker'
  args: ['build', '-t', 'gcr.io/$PROJECT_ID/demoweb:$TAG_NAME', '.']
  id: 'build-gcr'
- name: 'gcr.io/cloud-builders/docker'
  args: ['push', 'gcr.io/$PROJECT_ID/demoweb:$TAG_NAME']
  id: 'push-gcr'
- name: 'gliadevops/g8-docker'
  args: ['g8','deploy','app.yaml','--image-url=gcr.io/$PROJECT_ID/demoweb:$TAG_NAME','--version=$TAG_NAME','--dry']
  id: 'g8'
- name: 'gcr.io/cloud-builders/kubectl'
  args: ["apply","-f","g8"]
  env:
  - 'CLOUDSDK_COMPUTE_ZONE=asia-east1-a'
  - 'CLOUDSDK_CONTAINER_CLUSTER=studio'
  waitFor:
  - 'g8'
```
