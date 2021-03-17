FROM alpine

WORKDIR /app

RUN apk add --nRUN apk add --no-cache \
      curl \
      git

RUN curl -sLf https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN curl -sLf https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv4.0.5/kustomize_v4.0.5_linux_amd64.tar.gz -o kustomize.tar.gz\
    && tar xf kustomize.tar.gz \
    && mv kustomize /usr/local/bin \
    && chmod +x /usr/local/bin/kustomize \
    && rm -rf ./*
CMD ["kustomize"]
