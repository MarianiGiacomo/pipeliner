FROM ubuntu:16.04

WORKDIR /app

RUN apt update && apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable" && \
    apt update && apt install -y docker-ce docker-ce-cli containerd.io

COPY . .

ENTRYPOINT ["./build_img.sh"]
CMD ["-h"]

