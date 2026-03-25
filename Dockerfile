FROM python:3.12-alpine

RUN apk add --no-cache \
    ffmpeg \
    ca-certificates \
    && pip install --no-cache-dir yt-dlp \
    && adduser -D -u 1000 ytdlp

USER ytdlp
WORKDIR /downloads

ENTRYPOINT ["yt-dlp"]
