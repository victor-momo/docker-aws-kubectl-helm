FROM alpine:3.9


RUN apk add --no-cache ca-certificates \
 && apk add --no-cache curl jq python py-pip \
 && apk add --no-cache gettext tar gzip \
 && pip install awscli \
 && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
 && curl -L https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.3.0/heptio-authenticator-aws_0.3.0_linux_amd64 -o /usr/local/bin/aws-iam-authenticator \
 && curl -L https://storage.googleapis.com/kubernetes-helm/helm-v2.12.1-linux-amd64.tar.gz | tar xz \
 && wait \
 && chmod +x /usr/local/bin/aws-iam-authenticator \
 && chmod +x ./kubectl \
 && mv ./kubectl /usr/local/bin/kubectl \
 && mv linux-amd64/helm /usr/local/bin/helm \
 && mv linux-amd64/tiller /usr/local/bin/tiller \
 && rm -rf linux-amd64


CMD ["aws-iam-authenticator"]
