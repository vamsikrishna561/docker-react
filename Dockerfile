FROM node:alpine as Builders
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=Builders /app/build  /usr/share/nginx/html