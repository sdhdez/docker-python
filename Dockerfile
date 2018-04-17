FROM debian:testing
LABEL maintainer="Simon D. Hernandez <simondhdez@totum.one>"

# Python 3.6.5rc1
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

# Links
RUN ln -s -f /usr/bin/python3 /usr/bin/python && \
    ln -s -f /usr/bin/pip3 /usr/bin/pip

# Pip update
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir --upgrade setuptools wheel

# Python basics
RUN pip --no-cache-dir install \
    nose2 \
    pylint

# Extras
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            vim \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]
