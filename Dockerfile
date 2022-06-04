FROM ubuntu:latest
RUN apt update -y && \
    apt upgrade -y && \
    apt install python3 -y && \
    apt install pip -y && \
    pip install mkdocs-material
WORKDIR /usr/src/app
COPY . /usr/src/app
EXPOSE 8000
CMD ["mkdocs","serve","-a", "0.0.0.0:8000"]