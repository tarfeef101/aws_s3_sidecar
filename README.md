# aws_s3_sidecar
## Purpose
Run this container as a sidecar to other services in a deployment environment like an ECS cluster/service/task, K8S cluster/pod, etc. The container can be used to pull config files from S3 and expose them so that your other containers can access them through a shared volume without relying on persistent storage. This is useful for situations where you may be deploying someone else's images (like a vendor) and don't want to extend them and deal with hosting your own repos, etc. but you need to bring in configuration files or something similar to get them working.
## Usage
Deploy the container in an environment where it inherits an IAM role (i.e. an ECS task role), or provide the environment variables necessary to get `aws-cli` to pick up the credentials. To specify what files to expose, set the following environment variables:
- `BUCKET` should be the bucket you wish to retrieve the files from
- `FILES` is a `|`-delimited list of files within the bucket you wish to be exposed. Their full key will be used unless you use the `BASENAME` flag.
- `BASENAME` should be set to 1 if you want the files to be renamed to be only the basename (so `/opt/basename` vs `/opt/full/key/path/basename`).

The files will be exposed in a volume in `/opt`, which you should then mount in to any other containers you wish to acccess the files.
