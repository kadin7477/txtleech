FROM ubuntu:latest
RUN sudo apt-get update -y && sudo apt-get upgrade -y \
    && sudo apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/
RUN pip3 install --no-cache-dir --upgrade --requirement Installer
CMD python3 modules/main.py
