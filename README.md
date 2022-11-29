# MixMode Server 8.11

The MixMode server or 'brain'.

## VM OCI Image Creation

The GitLab pipeline uses `virt-v2v` and `virt-customize` to convert the MixMode VM then builds an OCI container. The converted VM is saved on S3 at `naps-dev-artifact/naps-dev/mixmode/[branch or tag]` ([ex](https://s3.console.aws.amazon.com/s3/object/naps-dev-artifacts?region=us-east-1&prefix=naps-dev/mixmode/feature/mm/mixmode-8.11-sda)) and the image uploaded to ECR at `ECR \ Repositories \ mixmode \ [branch or tag]` ([ex](https://us-east-1.console.aws.amazon.com/ecr/repositories/private/765814079306/mixmode/_/image/sha256:18435cb63d84c86034e31a4c7355efda1651ebe042d507720ef92eba5da15572/details?region=us-east-1)).

## Build Zarf Package

`zarf package create`

## Deploy Zarf Package

This package assumes the cluster is running KubeVirt and CDI and has the space and execution resources needed.

`zarf package deploy`
