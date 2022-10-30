FROM --platform=${TARGETPLATFORM} alpine

ARG BUILDPLATFORM
ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS
ARG TARGETVARIANT

EXPOSE 80
WORKDIR /
ENTRYPOINT ["./kiwiirc"]

RUN apk add unzip wget
RUN wget https://github.com/kiwiirc/kiwiirc/releases/download/v1.6.1/kiwiirc-server_v1.6.1-1_linux_${TARGETARCH}.zip -O /kiwiirc.zip
RUN unzip /kiwiirc.zip -d _tmp \
    && mv /_tmp/*/* / \
    && rm -rf /_tmp /kiwiirc.zip \
    && chmod +x kiwiirc \
    && ls -l /
