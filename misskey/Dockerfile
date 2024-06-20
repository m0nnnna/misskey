FROM docker.io/debian:bookworm
ENV NODE_MAJOR=20
RUN apt update;apt install -y bash curl openssl ffmpeg git python3 build-essential nginx redis unzip wget procps nano dnsutils
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update;apt-get install nodejs -y
WORKDIR /opt
RUN git clone -b master https://github.com/syuilo/misskey.git --depth=1
WORKDIR /opt/misskey
RUN npm install -g pnpm@9.0.6 vite 
RUN git submodule update --init
RUN pnpm install --frozen-lockfile
RUN NODE_ENV=production pnpm run build

RUN rm -rf /etc/nginx/conf.d/*
RUN rm -f /etc/nginx/sites-enabled/default 
RUN rm -f /etc/nginx/sites-available/default 

COPY start.sh /opt
COPY setup.sh /opt
COPY example.yml /opt/misskey/.config/default.yml
COPY conf/nginx.conf /etc/nginx/

COPY crontab /
