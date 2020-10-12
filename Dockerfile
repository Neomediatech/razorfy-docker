FROM alpine:3.12

LABEL maintainer="Dario <docker-dario@neomediatech.it>"

ENV VERSION=2.85-r9 \
    OS=alpine \
    SERVICE=razorfy

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
