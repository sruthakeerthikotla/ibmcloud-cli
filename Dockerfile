FROM node:14-alpine3.14 as builder

COPY install-base.sh install-base.sh
COPY install-ibmcloud.sh install-ibmcloud.sh

RUN ./install-base.sh
RUN ./install-ibmcloud.sh
RUN rm -f install-base.sh install-ibmcloud.sh

RUN mkdir /app

FROM scratch
COPY --from=builder / /
COPY .bash_profile /root
COPY .bash_aliases /root
VOLUME /app
ENV TERM xterm-256color
WORKDIR /app
ENTRYPOINT [ "bash", "-l" ]
