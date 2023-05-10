FROM node:18.16-alpine as build-step

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build

#server

FROM nginx:1.17.1-alpine

COPY --from=build-step /app/dist/dockerangular /usr/share/nginx/html