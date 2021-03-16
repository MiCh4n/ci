FROM alpine
RUN apk add --no-cache curl make git bash
RUN curl -Lo /usr/bin/kubectl https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl && chmod +x /usr/bin/kubectl
RUN curl -Lo /usr/bin/kustomize https://github.com/kubernetes-sigs/kustomize/releases/download/v4.0.5/kustomize_4.0.5_linux_amd64 && chmod +x /usr/bin/kustomize
COPY plugin.sh /plugin/
ENTRYPOINT [ "/plugin/plugin.sh" ]
