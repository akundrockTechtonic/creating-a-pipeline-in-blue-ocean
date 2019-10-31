FROM openjdk:latest
RUN apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
    apt install -y nodejs

