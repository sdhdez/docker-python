FROM debian:testing
LABEL maintainer="Simon D. Hernandez <simondhdez@totum.one>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            python3.6 \
            python3.6-dev \
            libpython3.6-dev \
            python3.6-venv \
            python-pip-whl \
            python3-pip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s -f /usr/bin/python3 /usr/bin/python && \
    ln -s -f /usr/bin/pip3 /usr/bin/pip

CMD ["bash"]
