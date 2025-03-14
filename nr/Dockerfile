FROM nodered/node-red:latest

USER root

RUN apk add --no-cache \
      chromium \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont \
      nodejs \
      yarn

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

RUN npm i cheerio

RUN npm i puppeteer

RUN npm install node-red-contrib-whatsapp-link

RUN npm install node-red-contrib-image-tools

USER node-red