FROM golang:latest

ENV NODE_URL https://deb.nodesource.com/setup_16.x

#ENV REPO https://github.com/tidbyt/pixlet.git
ENV REPO https://github.com/tavdog/pixlet

RUN apt update && apt upgrade && apt install unzip libwebp-dev iputils-ping -y

WORKDIR /tmp
RUN curl -fsSL NODE_URL | bash - && apt-get install -y nodejs && node -v

RUN git clone REPO
WORKDIR /tmp/pixlet
RUN npm install && npm run build && make build

EXPOSE 8080

CMD ["bash"]
