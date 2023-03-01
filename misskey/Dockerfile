FROM alpine:20221110
RUN apk update;apk add nano openssl postgresql nodejs-current npm redis git build-base yarn bash python3 nginx
WORKDIR /opt
RUN git clone -b master https://github.com/syuilo/misskey.git --depth=1
RUN npm install -g pnpm vite 
WORKDIR /opt/misskey
RUN git submodule update --init;pnpm install --frozen-lockfile
RUN NODE_ENV=production pnpm run build
RUN rm -rf /etc/nginx/conf.d/*
RUN rm -f /etc/nginx/sites-enabled/default 
RUN rm -f /etc/nginx/sites-available/default 
COPY start.sh /opt
COPY setup.sh /opt
COPY example.yml /opt/misskey/.config/default.yml
COPY misskey.conf /etc/nginx/sites-enabled/
COPY nginx.conf /etc/nginx/
RUN mv /etc/nginx/nginx.conf /etc/nginx/
CMD bash /opt/start.sh