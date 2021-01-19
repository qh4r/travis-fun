FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# elasticbeanstalk uses this, otherwise expose has no effect
COPY --from=builder /app/build /usr/share/nginx/html
# defaultowa komenda na startup wystarcza


