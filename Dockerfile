FROM alpine:3.9


RUN apk add --no-cache ca-certificates \
 && apk add --no-cache curl jq python py-pip \
 && apk add --no-cache -t deps curl  \
 && apk add --no-cache gettext tar gzip \
 && pip install awscli \
 && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
 && chmod +x ./kubectl \
 && mv ./kubectl /usr/local/bin/kubectl \
 && curl -L https://storage.googleapis.com/kubernetes-helm/helm-v2.12.1-linux-amd64.tar.gz | tar xz \
 && mv linux-amd64/helm /usr/local/bin/helm \
 && rm -rf linux-amd64 


CMD ["helm"]
