# FROM node:alpine as builder
FROM node:alpine
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# elasticbeanstalk uses this, otherwise expose has no effect
# COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html
# domyslnie nienazwane kontenery tymczasowe sa nazywane jako kolejne liczby naturalne
# defaultowa komenda na startup wystarcza


