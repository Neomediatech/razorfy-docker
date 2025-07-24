FROM alpine:3.22

ENV OS=alpine \
    SERVICE=razorfy \
    NAME=razorfy-docker

LABEL maintainer="Dario <docker-dario@neomediatech.it>" \ 
      org.label-schema.version=$VERSION \
      org.label-schema.vcs-type=Git \
      org.label-schema.vcs-url=https://github.com/Neomediatech/${NAME} \
      org.label-schema.maintainer=Neomediatech

RUN addgroup razor 2>/dev/null \
    && adduser -D --gecos "razor antispam" --ingroup razor razor 2>/dev/null \
    && mkdir /home/razor/.razor && chown razor:razor /home/razor/.razor \
    && apk add --no-cache razor

WORKDIR /home/razor/.razor
COPY --chown=razor:razor razor-agent.conf .

WORKDIR /
COPY entrypoint.sh razorfy.pl ./

RUN chmod +x razorfy.pl entrypoint.sh

CMD [ "/entrypoint.sh" ]
EXPOSE 11342
