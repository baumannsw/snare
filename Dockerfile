FROM python:3.12.8-alpine3.20

WORKDIR /app

RUN apk add --no-cache --update git build-base \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

COPY requirements.txt .
RUN python -m pip install --no-cache-dir --upgrade pip setuptools \
    && python -m pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python setup.py install

ARG PAGE_URL=example.com
ENV PAGE_URL=$PAGE_URL \
    PORT=80 \
    TANNER=tanner.mushmush.org

RUN clone --target "http://$PAGE_URL"


ENTRYPOINT ["/bin/sh", "-c", "exec snare --no-dorks=true --auto-update=false --host-ip=0.0.0.0 --port=\"$PORT\" --page-dir=\"$PAGE_URL\" --tanner=\"$TANNER\""]