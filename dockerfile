FROM golang:latest

ENV NODE_URL https://deb.nodesource.com/setup_16.x

#ENV REPO https://github.com/tidbyt/pixlet.git
ENV REPO https://github.com/tavdog/pixlet

RUN apt update && apt upgrade && apt install libwebp-dev -y

WORKDIR /tmp
RUN curl -fsSL $NODE_URL | bash - && apt-get install -y nodejs && node -v

WORKDIR /
RUN git clone $REPO
WORKDIR /pixlet
RUN npm install && npm run build && make build

EXPOSE 8080

CMD ["bash"]
