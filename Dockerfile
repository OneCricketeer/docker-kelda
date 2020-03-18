ARG VER_BITNAMI=1.15
FROM bitnami/kubectl:${VER_BITNAMI}

USER root
RUN mkdir -p /.kube && chmod -R 770 /.kube
WORKDIR /tmp
RUN curl -fsSL -o kelda-install.sh 'https://kelda.io/install.sh' \
  && (sh kelda-install.sh || true) > /dev/null 2>&1 \
  && mv kelda /usr/local/bin && rm -f kelda-install.sh

ARG DOCKERIZE_VERSION=v0.6.1
RUN curl -fsSL "https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" | tar -xzC /usr/local/bin

WORKDIR /app
VOLUME /app

COPY kube-config.yaml.tmpl /tmp/
COPY docker-entrypoint.sh /

USER 1001
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "--help" ]
