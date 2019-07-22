FROM alpine:3.9


RUN apk add --no-cache ca-certificates \
 && apk add --no-cache curl jq python py-pip \
 && apk add --no-cache gettext tar gzip \
 && pip install awscli \
 && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
 && curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/darwin/amd64/aws-iam-authenticator \
 && curl -L https://storage.googleapis.com/kubernetes-helm/helm-v2.12.1-linux-amd64.tar.gz | tar xz \
 && chmod +x ./aws-iam-authenticator \
 && chmod +x ./kubectl \
 && mv ./kubectl /usr/local/bin/kubectl \
 && mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator \
 && mv linux-amd64/helm /usr/local/bin/helm \
 && mv linux-amd64/tiller /usr/local/bin/tiller \
 && rm -rf linux-amd64 


CMD ["helm"]
