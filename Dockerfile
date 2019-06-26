FROM alpine:3.9


RUN apk add --no-cache ca-certificates \
 && apk add --no-cache curl jq python py-pip \
 && apk add --no-cache -t deps curl  \
 && apk add --no-cache gettext tar gzip \
 && pip install awscli \
 && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && curl -LO https://git.io/get_helm.sh \
 && chmod 700 get_helm.sh \
 && ./get_helm.sh

CMD ["helm"]
